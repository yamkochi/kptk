import 'package:av_net_shop/size_config.dart';
import 'package:flutter/material.dart';


class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key, required this.text, required this.press,
  }) : super(key: key);

  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18), color: Colors.black),
          ),
          GestureDetector(child: Text("See More"),
          onTap: press,),
        ],
      ),
    );
  }
}
