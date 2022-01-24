import 'package:av_net_shop/screens/otp/otp_screen.dart';
import 'package:av_net_shop/screens/splash/components/custom_suffix_icon.dart';
import 'package:av_net_shop/screens/splash/components/default_button.dart';
import 'package:av_net_shop/screens/splash/components/form_error.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({ Key? key }) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
final _formKey = GlobalKey<FormState>();
  late String firstName;
  late String lastName;
  late String phoneNumber;
  late String address;

  final List<String> errors = [];

  void addError({required String error}) {
   // print("add adderror");
    if (!errors.contains(error)) {
     // print("inside  adderror ");
      setState(() {
        errors.add(error);
      });
    }
  }
//print("adding {$error}");
  void removeError({required String error}) {
  //  print("removing error");
    if (errors.contains(error)) {
    //  print("inside removing error");
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
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
           buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(15)),
          DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.pushNamed(context, OtpScreen.routName);
                }
              }),
        ],
      ),
    );
  }



  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          //  print("{$value} add empty");
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
     
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        } 
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your First Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          //  print("{$value} add empty");
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
     
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        } 
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your Last Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }


  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      onSaved: (newValue) => phoneNumber = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          //  print("{$value} add empty");
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.number,
      onChanged: (value) {
     
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        } 
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          //  print("{$value} add empty");
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
     
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        } 
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your Address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

}