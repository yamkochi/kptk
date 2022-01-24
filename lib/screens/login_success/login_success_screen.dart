import 'package:av_net_shop/screens/login_success/components/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginSuccessScreen extends StatelessWidget {
  static String routName = '/login_success';
  LoginSuccessScreen({Key? key}) : super(key: key);

  //final serviceController = Get.find<Services>();
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        //title:Text('okkkk')
       title: data['first_name']=='0'
           ? Text('UserName not existing')
           : Text('${data['first_name']} ${data['last_name']}'),
      ),
      body: Body(mydata: data),
    );
  }
}
