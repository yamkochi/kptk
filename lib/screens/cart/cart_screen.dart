import 'package:av_net_shop/constants.dart';
import 'package:av_net_shop/screens/splash/components/default_button.dart';
import 'package:av_net_shop/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/body.dart';

class CartScreen extends StatelessWidget {
  static String routName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckOurCard(),
    );
  }

  // ignore: non_constant_identifier_names
  AppBar BuildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text("Your Cart",
          style: TextStyle(color: Colors.black),),
          Text("4 Items",
          style: Theme.of(context).textTheme.caption,),
        ],
      ),
    );
  }
}

class CheckOurCard extends StatelessWidget {
  const CheckOurCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30)
      ),
      //for demo
     // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)),
         boxShadow: [
          BoxShadow(
            offset:Offset (0,-15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.9)
          ),
        ]
      
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFF5F6F9),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                //Spacer(),
                Text("Add Voucher Code"),
                const SizedBox(width: 10,),
                Icon(Icons.arrow_forward_ios,
                size: 12,
                color: kTextColor,)
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text.rich(TextSpan(text:"Total:\n",
              children: [
                TextSpan(
                  text: "\$556.00",style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  )
                )
              ]
              )),
              SizedBox(width: getProportionateScreenWidth(190),
              child: DefaultButton(text: "Chech Out", press: (){}),   ),
              //DefaultButton(text: "Chech Out", press: (){}),
            ],)
      
          ],
        ),
      ),
    );
  }
}
