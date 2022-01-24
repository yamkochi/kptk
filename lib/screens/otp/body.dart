
import 'package:av_net_shop/constants.dart';
import 'package:av_net_shop/screens/sign_up/components/otp_form.dart';
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
            SizedBox(height: SizeConfig.screenHeight!*.05,),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              Text("We sent the OTP to your mobile no 98798798"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight!*.01,),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight!*.01,),
              GestureDetector(
                onTap: (){
                  //resend otp
                },
                child: Text("Re-Send OTP code",style: TextStyle(decoration: TextDecoration.underline),))
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Your code will expire in "),
        TweenAnimationBuilder(
          tween: IntTween(begin: 30, end: 0),
          duration: Duration(seconds: 30),
          builder: (BuildContext context, value, Widget? child) => Text(
            '$value',
            style: TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}

