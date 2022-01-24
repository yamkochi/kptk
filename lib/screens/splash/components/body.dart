import 'package:av_net_shop/constants.dart';
import 'package:av_net_shop/kpakka_kacheri/controller/kpakka_controller.dart';
import 'package:av_net_shop/kpakka_kacheri/view/disp_next_kacheri.dart';
import 'package:av_net_shop/screens/sign_in/sign_in_screen.dart';
import 'package:av_net_shop/screens/splash/components/splash_content.dart';
import 'package:av_net_shop/mela_ragam/view/disp_mela_raga.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "heading": 'Ragam',
      "text": "Ragam & Song",
      "image": "assets/images/splash_1.png"
    },
    {
      "heading": 'கடைசி பக்கம் ',
      "text": "திண்ணை  கச்சேரி ",
      "image": "assets/images/meeting.png"
    },
    {
      "heading": 'wait...',
      "text": "Music Links \ ",
      "image": "assets/images/splash_3.png"
    },
  ];

  final kpakkamController = Get.put(KpakkamController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                  heading: splashData[index]['heading']!,
                  text: splashData[index]['text']!,
                  image: splashData[index]['image']!),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Column(
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        splashData.length, (index) => buildDot(index: index)),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  DefaultButton(
                      text: 'Continue :$currentPage',
                      press: () {
                        // Navigator.pushNamed(context, SignInScreen.routName);

                        if (currentPage == 0)
                          Get.to(() => MelaRagaPage());
                        else if (currentPage == 1) {
                         
                         
                          
                          Get.to(() => DispNextKacherry());
                        } else if (currentPage == 2)
                          Get.to(() => SignInScreen());
                      }),
                  Spacer(
                    flex: 2,
                  ),

                  //Obx(()=>Text("${mc.melaragam[0].melaName}")),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
