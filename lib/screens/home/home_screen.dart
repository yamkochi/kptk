import 'package:av_net_shop/screens/home/components/body.dart';
import 'package:av_net_shop/screens/profile/components/custom_button_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';

class HomeScreen extends StatelessWidget {
  static String routName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottonNavBar(
        selectedMenu: MenuState.message,
      ),
    );
  }
}
