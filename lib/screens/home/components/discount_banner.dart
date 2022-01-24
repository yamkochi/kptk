import 'package:flutter/material.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15)),
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(20),
          color: Color(0xFF4a3298)),
      child: Text.rich(
        TextSpan(
            text: "A Summer Special\n",
            style: TextStyle(color: Colors.white),
            children: [
              TextSpan(
                  text: 'Cash Back 20%',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
            ]),
      ),
    );
  }
}
