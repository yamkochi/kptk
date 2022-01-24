import 'package:av_net_shop/screens/forgot_password/forgot_password_screen.dart';
import 'package:av_net_shop/screens/login_success/login_success_screen.dart';
import 'package:av_net_shop/screens/sign_up/controller/service.dart';
import 'package:av_net_shop/screens/splash/components/custom_suffix_icon.dart';
import 'package:av_net_shop/screens/splash/components/default_button.dart';
import 'package:av_net_shop/screens/splash/components/form_error.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignForm> {
  final serviceController = Get.put(Services());
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String email;
  late String password;
  bool remember = false;

  //late List<AvsUser> avsUser;
  Map data = {};
  Map map = {};

  @override
  void initState() {
    super.initState();
  }

  void addError({required String error}) {
    print("error pm: $error");
    if (!errors.contains(error)) {
      print("inside error pm: $error");
      setState(() {
        errors.add(error);
        print(errors);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  Future<void> startService() async {
    map = {'mail': email, 'password': password};

    await serviceController.getUser(task: 'getUser2.php', param: map);

    print("after user verification");
    data = {
      'first_name': serviceController.users[0].firstName,
      'last_name': serviceController.users[0].lastName
    };
    print(data['first_name']);
    // Navigator.pushNamed(context, LoginSuccessScreen.routName, arguments: data);
    Get.to(() => LoginSuccessScreen(), arguments: data);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          Row(children: [
            Checkbox(
                activeColor: kPrimaryColor,
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                }),
            Text("Remember Me"),
            Spacer(),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, ForgotPasswordScreen.routName),
              child: Text(
                "Forget Password",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ]),
          DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  startService();
                }
              }),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            removeError(error: kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            removeError(error: kShortPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          setState(() {
            addError(error: kPassNullError);
          });

          return "";
        } else if (value.length < 8) {
          setState(() {
            addError(error: kShortPassError);
          });

          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue!,
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
