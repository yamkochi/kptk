
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:av_net_shop/kpakka_kacheri/controller/kpakka_controller.dart';
import 'package:av_net_shop/kpakka_kacheri/view/disp_future_kacheri.dart';
import 'package:av_net_shop/kpakka_kacheri/view/disp_past_kacheri.dart';
import 'package:av_net_shop/sub_ragam/controller/crud_controller.dart';

class DispNextKacherry extends StatelessWidget {
  final kpakkamController = Get.put(KpakkamController());
  final crudController = Get.put(CrudController());
  final url = "https://yamkochi.in";
  final url2 = "https://yamkochi.in/music/user_photos/";

  String? formatDate(datestr) {
    return DateFormat.yMMMd().format(DateTime.parse(datestr));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[100],
        title: Text(
          'இந்த வார கச்சேரி',
          style: TextStyle(
            fontSize: 25,
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
                        itemCount: controller.kPakkam.length,
                        itemBuilder: (context, index) {
                          return Card(
                              color: Colors.red[100],
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                       // CachedNetworkImage(imageUrl:'$url${controller.kPakkam[index].poster}'),
                                         
                                        Text(
                                          '${controller.kPakkam[index].topic}',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.bold),
                                          // overflow:TextOverflow.ellipsis ,
                                        ),
                                        Text(
                                          DateFormat.yMMMd().format(
                                            DateTime.parse(
                                                '${controller.kPakkam[index].dok}'),
                                          ),
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.green[800],
                                              fontWeight: FontWeight.bold),
                                        ),
                                       CachedNetworkImage(
                                             placeholder: (context, url) =>
                                                 const CircularProgressIndicator(),
                                             imageUrl:
                                                 '$url${controller.kPakkam[index].poster}',
                                           ),
                                        
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blueAccent)),
                                          // color: Colors.yellow[50],
                                          width: 300,
                                          height: 100,
                                          margin:
                                              EdgeInsets.fromLTRB(16, 8, 8, 8),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.vertical,
                                                child: Text(
                                                  controller
                                                      .kPakkam[index].detail,
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue[800],
                                                  ),
                                                ),
                                              )),
                                        ),
                                       // '$url2${controller.kPakkam[index].uid}.png',
                                       
                                       
                                          CachedNetworkImage(
                                             placeholder: (context, url) =>
                                                 const CircularProgressIndicator(),
                                             imageUrl:
                                                 '$url2${controller.kPakkam[index].uid}.png',
                                           ),
                                        Text(
                                          "கச்சேரியின் நாயகன்",
                                          style: TextStyle(
                                            backgroundColor: Colors.yellow[100],
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue[800],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // kpakkamController.
                    //       getKpakkam(task: 'getKpakkam.php', param: {'action': 'PAST'});

                    Get.to(() => DispPastKacherry());
                  },
                  child: Icon(Icons.fast_rewind),
                ),
                ElevatedButton(
                  onPressed: () async {
                    //kpakkamController.
                    //  getKpakkam(task: 'getKpakkam.php', param: {'action': 'FUTURE'});

                    Get.to(() => DispFutureKacherry());
                  },
                  child: Icon(Icons.fast_forward),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
