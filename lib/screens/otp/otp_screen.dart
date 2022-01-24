
import 'package:av_net_shop/screens/otp/body.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  static String routName = '/otp';
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Body(),
    );
  }
}
