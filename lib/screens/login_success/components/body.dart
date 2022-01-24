import 'package:av_net_shop/screens/splash/components/default_button.dart';
import 'package:av_net_shop/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  Body({Key? key, required this.mydata}) : super(key: key);
  final Map mydata;
  final url2 = "https://yamkochi.in/music/user_photos/";
  // final serviceController = Get.find<Services>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight! * .03,
        ),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight! * .3,
        ),
        SizedBox(
          height: SizeConfig.screenHeight! * .03,
        ),
        Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              placeholder: (context, url) => const CircularProgressIndicator(),
              imageUrl: '$url2${mydata['uid']}.png',
            ),
          ),
        ),
        //Text('${serviceController.users[0].lastName}'),
        Center(
          child: Text(mydata['uid']=='0' ? 'Invalid UserName/Password'
           :'${mydata['first_name']} ${mydata['last_name']}',
            // 'Hi ${serviceController.users[0].lastName}',
            style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(15),
                fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(),
        SizedBox(
            width: SizeConfig.screenWidth! * .6,
            child: DefaultButton(
                text: "Back to Home",
                press: () {
                  // Navigator.pushNamed(context, HomeScreen.routName);
                  Get.toNamed('/home_screen');
                })),
        Spacer(),
      ],
    );
  }
}
