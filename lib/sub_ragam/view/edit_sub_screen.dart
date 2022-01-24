

import 'package:av_net_shop/sub_ragam/view/body.dart';
import 'package:flutter/material.dart';

class EditSubScreen extends StatelessWidget {
  static String routName = "/edit_sub_screen";
  const EditSubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Sub Raga"),
      ),
      body:Body()
    );
  }
}
