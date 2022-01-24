import 'package:av_net_shop/kptk_sign_up/complete_profile/components/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routName = '/complete_profile';
  CompleteProfileScreen({Key? key}) : super(key: key);
  static Map data = {};

  @override
  Widget build(BuildContext context) {
    data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        //title: Text("Sign UP ${Get.arguments['password']}"),
        title: Text("Sign UP ${data['password']}"),
      ),
      body: Body(data:data),
    );
  }
}
