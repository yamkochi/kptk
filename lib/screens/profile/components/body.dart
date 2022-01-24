import 'package:av_net_shop/screens/profile/components/profile_menu.dart';
import 'package:av_net_shop/screens/profile/components/profile_picture.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePicture(),
        SizedBox(
          height: 20,
        ),
        ProfileMenu(
          icon: "assets/icons/User Icon.svg",
          text: '"My Account"',
           press: () {  }, ),
            ProfileMenu(
          icon: "assets/icons/Bell.svg",
          text: "Notifications",
           press: () {  }, ),
            ProfileMenu(
          icon: "assets/icons/Question mark.svg",
          text: "Settings",
           press: () {  }, ),
            ProfileMenu(
          icon: "assets/icons/User Icon.svg",
          text: "Help Centre",
           press: () {  }, ),
            ProfileMenu(
        icon: 'assets/icons/Log out.svg',
        text: 'LogOut',
         press: () {  }, ),
      ],
    );
  }
}

