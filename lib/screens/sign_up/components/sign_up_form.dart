import 'package:av_net_shop/screens/complete_profile/complete_profile_screen.dart';
import 'package:av_net_shop/screens/splash/components/custom_suffix_icon.dart';
import 'package:av_net_shop/screens/splash/components/default_button.dart';
import 'package:av_net_shop/screens/splash/components/form_error.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String confirmpassword;
  Map data={};
  final List<String> errors = [];

  void addError({required String error}) {
    print("add adderror");
    if (!errors.contains(error)) {
      print("inside  adderror ");
      setState(() {
        errors.add(error);
      });
    }
  }

  //print("adding {$error}");
  void removeError({required String error}) {
    print("removing error");
    if (errors.contains(error)) {
      print("inside removing error");

      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfPassword(),
          SizedBox(height: getProportionateScreenHeight(40)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                 // Navigator.pushNamed(context, CompleteProfileScreen.routName);

                 data = {
                   'email': email,
                   'password': password
                 };
                  Get.to(()=>CompleteProfileScreen(),arguments:data );
                }
              }),
        ],
      ),
    );
  }

  TextFormField buildConfPassword() {
    return TextFormField(
      onSaved: (newValue) => confirmpassword = newValue!,
      onChanged: (value) {
        if (value == password) {
          removeError(error: kMatchPassError);
          if (errors.contains(kPassNullError)) {
            removeError(error: kPassNullError);
          }
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value != password) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Confirmpassword",
        hintText: "Re enter your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
          if (value.length >= 8) {
            removeError(error: kShortPassError);
          }
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
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
        if (value!.isEmpty) {
          //  print("{$value} add empty");
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          // print("{$value} add mail error");
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        // print("{$value} remove");
        if (value.isNotEmpty) {
          print("{$value} remove empty");

          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          // print("{$value} remove mail err");
          removeError(error: kInvalidEmailError);
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
