import 'package:flutter/material.dart';

import 'package:av_net_shop/kptk_sign_up/components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routName = '/sign_up';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}
