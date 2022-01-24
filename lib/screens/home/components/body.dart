import 'package:av_net_shop/screens/home/components/discount_banner.dart';
import 'package:av_net_shop/screens/home/components/popular_products.dart';
import 'package:av_net_shop/screens/home/components/special_offers.dart';
import 'package:av_net_shop/screens/login_success/components/home_header.dart';
import 'package:av_net_shop/size_config.dart';
import 'package:flutter/material.dart';

import 'categories.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            HomeHeader(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            DiscountBanner(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Categories(),
            SpecialOffers(),
            const SizedBox(
              height: 5,
            ),
            PopularProducts(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
          ],
        ),
      ),
    );
  }
}
