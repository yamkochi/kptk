import 'package:av_net_shop/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Categories extends StatelessWidget {
  // Categories({ Key? key }) : super(key: key);

  List<Map<String, dynamic>> categories = [
    {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
    {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
    {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
    {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
    {"icon": "assets/icons/Discover.svg", "text": "More"},
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(29)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(categories.length,(index)
          // =>Text(categories[index]['icon'])

            => CategoryCard(
                icon: categories[index]["icon"],
                text: categories[index]["text"],
                press: () {}),

          )
        ],
      ),
    );
  }
}


// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  

   const CategoryCard({
    Key? key,
    required final this.icon,
    required final this.text,
    required final this.press,
  }) : super(key: key);

  // final List<Map<String, dynamic>> categories;
  final String icon;
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                    color: Color(0xFFFFECDF),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(icon),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
