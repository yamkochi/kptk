import 'package:av_net_shop/screens/details/components/custom_app_bar.dart';
import 'package:av_net_shop/screens/home/models/Product.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  static String routName = '/details';
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //to get the data from the clalling page
    final ProductDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: arguments.product.rating),
      body: Body(product: arguments.product),
    );
  }
}

// to get product as parameter from the called screen
class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}





