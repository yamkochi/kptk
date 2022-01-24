// ignore_for_file: must_be_immutable

import 'package:av_net_shop/constants.dart';
import 'package:av_net_shop/kptk_sign_up/complete_profile/components/complete_profile_form.dart';

import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
   Map data = {};
  Body({Key? key,  required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text(
                "Complete Profile ${data['password']}",
                style: headingStyle,
              ),
              Text(
                "Complete with your Detrails or \n Continue with Social Media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * .05,
              ),
              CompleteProfileForm(),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Text(
                "By continuing you agree that \n you accept our Terms and Conditions",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
