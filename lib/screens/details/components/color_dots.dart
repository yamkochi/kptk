
import 'package:av_net_shop/components/rounded_icon_btn.dart';
import 'package:av_net_shop/screens/home/models/Product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ColorDotsState createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
   int selectedColor=0;
  @override
  Widget build(BuildContext context) {
   //  int selectedColor = 1;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
              widget.product.colors.length,
              (index) => ColorDot(
                  color: widget.product.colors[index],
                  isSelected: selectedColor == index,
                  press: () {
                    setState(() {
                      selectedColor = index;
                    });
                  })),
                  Spacer(),
                  RoundedIconBtn(iconData: Icons.remove, press: (){}),
                  SizedBox(width: getProportionateScreenWidth(15),),
                  RoundedIconBtn(iconData: Icons.add, press: (){}),
              
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    required this.press,
    required this.isSelected,
  }) : super(key: key);

  //final Product product;

  final Color color;
  final bool isSelected;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(right: 2),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelected ? kPrimaryColor : Colors.transparent),
            shape: BoxShape.circle),
        child: DecoratedBox(
            decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
      ),
    );
  }
}
