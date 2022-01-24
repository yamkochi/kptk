import 'package:av_net_shop/screens/cart/cart_screen.dart';
import 'package:av_net_shop/screens/home/components/icon_btn_with_counter.dart';
import 'package:av_net_shop/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            press: () {
              Navigator.popAndPushNamed(context, CartScreen.routName);
            },
            svgSrc: 'assets/icons/Cart Icon.svg',
          ),
          IconBtnWithCounter(
            press: () {},
            svgSrc: 'assets/icons/Bell.svg',
            numOfItems: 3,
          ),
        ],
      ),
    );
  }
}
