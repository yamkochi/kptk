import 'package:av_net_shop/screens/home/models/Product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(200),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(widget.product.images[selectedImage]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  buildSmallPreview()
            ...List.generate(widget.product.images.length,
                (int index) => buildSmallPreview(index: index)),
          ],
        )
      ],
    );
  }

  Container buildSmallPreview({required int index}) {
    return Container(
      margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenHeight(50),
      width: getProportionateScreenWidth(50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: selectedImage == index ? kPrimaryColor : Colors.transparent),
      ),
      child: GestureDetector(
          onTap: () {
            setState(() {
              selectedImage = index;
            });
          },
          child: Image.asset(
            widget.product.images[index],
          )),
    );
  }
}
