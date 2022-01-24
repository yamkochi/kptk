import 'package:av_net_shop/kptk_sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Don't Have an Account?",
          style: TextStyle(fontSize: getProportionateScreenWidth(10))),
      GestureDetector(
        onTap: () {
          // Navigator.pushNamed(context, SignUpScreen.routName);
         // Get.toNamed('/sign_up_screen');
          //Get.to(() => SubRagaPage(), arguments: {'melaName': '${controller.melaRagam[index].melaName}'});
           Get.to(() => SignUpScreen(), );
        },
        child: Text(
          "Sign Up",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(10), color: kPrimaryColor),
        ),
      ),
    ]);
  }
}
