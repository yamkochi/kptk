

import 'package:av_net_shop/kpakka_kacheri/controller/kpakka_controller.dart';
import 'package:av_net_shop/sub_ragam/controller/crud_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DispFutureKacherry extends StatelessWidget {
  final kpakkamController = Get.put(KpakkamController());
  final crudController = Get.put(CrudController());
  final url = "https://yamkochi.in";
final url2 = "https://yamkochi.in/music/user_photos/";
  Future<bool> _onPressBack() async {
    //kpakkamController.getKpakkam(
    //                          task: 'getKpakkam.php',
    //                          param: {'action': 'NEXT'});
    return true;
  }
  String formatDate(datestr) {
    return DateFormat.yMMMd().format(DateTime.parse(datestr));
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPressBack,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: Text(
            'காத்திருக்கும் கச்சேரிகள்',
           style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue[800],
          ),
          ),
        ),
       
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GetX<KpakkamController>(builder: (controller) {
                  return kpakkamController.isLoading.isFalse
                      ? ListView.builder(
                          itemCount: controller.kPakkamF.length,
                          itemBuilder: (context, index) {
                            return Card(
                                color: Colors.green[100],
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    children: [
                                       Text(
                                                '${controller.kPakkamF[index].topic}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.red,
                                                ),
                                                // overflow:TextOverflow.ellipsis ,
                                              ),
                                              Text(
                                                formatDate('${controller.kPakkamF[index].dok}'),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.red,
                                                ),
                                              ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [

                                         
                                          Container(
                                              width: 100,
                                              height: 100,
                                              margin: EdgeInsets.fromLTRB(
                                                  16, 8, 8, 8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child:  CachedNetworkImage(
                                             placeholder: (context, url) =>
                                                 const CircularProgressIndicator(),
                                             imageUrl:
                                                 '$url2${controller.kPakkamF[index].uid}.png',
                                           ),

                                              ),
                                            ),

                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          Colors.blueAccent)),
                                              // color: Colors.yellow[50],
                                              width: 100,
                                              height: 100,
                                              margin: EdgeInsets.fromLTRB(
                                                  16, 8, 8, 8),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    child: Text(
                                                      controller.kPakkamF[index]
                                                          .detail,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue[800],
                                                      ),
                                                    ),
                                                  )),
                                            ),


                                            Container(
                                              width: 100,
                                              height: 100,
                                              margin: EdgeInsets.fromLTRB(
                                                  16, 8, 8, 8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child:  CachedNetworkImage(
                                             placeholder: (context, url) =>
                                                 const CircularProgressIndicator(),
                                             imageUrl:
                                                 '$url${controller.kPakkamF[index].poster}',
                                           ),

                                              ),
                                            ),
                                           
                                          
                                          


                                        ],
                                      ),
                                    ],
                                  ),
                                ));
                          },
                        )
                      : CircularProgressIndicator(
                          color: Colors.amber,
                          strokeWidth: 5.0,
                          semanticsLabel: 'fffff',
                        );
                }),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
