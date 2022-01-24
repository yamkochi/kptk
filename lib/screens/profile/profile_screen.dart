import 'package:flutter/material.dart';

import '../../enums.dart';
import 'components/body.dart';
import 'components/custom_button_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  static String routName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottonNavBar(
        selectedMenu: MenuState.message,
      ),
    );
  }
}
