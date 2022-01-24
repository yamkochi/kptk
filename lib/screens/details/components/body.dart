import 'package:av_net_shop/screens/details/components/color_dots.dart';
import 'package:av_net_shop/screens/details/components/product_description.dart';
import 'package:av_net_shop/screens/details/components/product_images.dart';
import 'package:av_net_shop/screens/details/components/top_rounded_container.dart';
import 'package:av_net_shop/screens/home/models/Product.dart';
import 'package:av_net_shop/screens/splash/components/default_button.dart';
import 'package:av_net_shop/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.blue.shade50,
            child: Column(
              children: [
                ProductDescription(product: product, pressOnSeeMore: () {}),
                TopRoundedContainer(
                  color: Colors.blue.shade100,
                  child: Column(
                    children: [
                      ColorDots(product: product),
                      TopRoundedContainer(color: Colors.blue.shade100, 
                      child: Padding(
                        padding:  EdgeInsets.only(
                          left: SizeConfig.screenWidth!*0.15,
                          right: SizeConfig.screenWidth!*0.15,
                          top: getProportionateScreenWidth(15),
                          bottom: getProportionateScreenWidth(15)
                          ),
                        child: DefaultButton(text: "Add to Cart", 
                        press: (){}),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
