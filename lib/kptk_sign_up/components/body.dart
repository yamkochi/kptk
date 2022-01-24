import 'package:av_net_shop/constants.dart';
import 'package:av_net_shop/kptk_sign_up/components/sign_up_form.dart';
import 'package:av_net_shop/screens/splash/components/social_card.dart';
import 'package:av_net_shop/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight!*.03,),
              Text(
                "Register Account",
                style: headingStyle,
              ),
              Text(
                "Completeyour details or \n Continue with Social Media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight!*0.07),
              SignUpForm(),
             // SizedBox(height: getProportionateScreenHeight(5)),            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: "assets/icons/google-icon.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/facebook-2.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10),),
              Text("By continuing you confirm that \n you are agreeing with our terms and Condition ",
              textAlign: TextAlign.center,)
        
            ],
          ),
        ),
      ),
    );
  }
}


