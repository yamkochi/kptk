import 'package:av_net_shop/mela_ragam/controller/mela_controller.dart';
import 'package:av_net_shop/sub_ragam/controller/sub_raga_controller.dart';
import 'package:av_net_shop/sub_ragam/view/disp_sub_raga.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MelaRagaPage extends StatelessWidget {
  final melaController = Get.put(MelaController());
  final subRagaController = Get.put(SubRagaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text("Mela Ragam",
            style: TextStyle(color: Colors.red, fontSize: 25)),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     melaController
      //         .getRagams(task: 'getMela.php', param: {'action': 'GET_ALL'});
      //   },
      //   backgroundColor: Colors.amber[100],
      //   icon: Icon(
      //     Icons.add_shopping_cart_rounded,
      //     color: Colors.black,
      //   ),
      //   label: Text(
      //     //'Test..${melaController.melaRagam[0].melaName}',
      //     'Test',
      //     style: TextStyle(color: Colors.green, fontSize: 25),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<MelaController>(builder: (controller) {
                return melaController.isLoading.isFalse
                    ? ListView.builder(
                        itemCount: controller.melaRagam.length,
                        itemBuilder: (context, index) {
                          return Card(
                              color: Colors.lime,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          '${controller.melaRagam[index].melaNo}',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${controller.melaRagam[index].melaName}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              Text(
                                                '${controller.melaRagam[index].swaram}',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            //cartControler.addToCart(controler.products[index]);
                                          },
                                          // color: Colors.blue,
                                          // textColor: Colors.white,
                                          child: Text("Listen"),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        //  Obx(() => Text('${subRagaController.janyaId}'));
                                        // String xx =
                                        //    '${controller.melaRagam[index].melaNo}';
                                        // subRagaController.updateJanyaId(3);
                                        subRagaController.getRagam(
                                            task: 'getSubRaga.php',
                                            param: {
                                              'action': 'GET_ALL',
                                              'mela_no':
                                                  '${controller.melaRagam[index].melaNo}'
                                            });

                                        Get.to(() => SubRagaPage(), arguments: {
                                          'melaName':
                                              '${controller.melaRagam[index].melaName}',
                                          'melaNo':
                                              '${controller.melaRagam[index].melaNo}',
                                          'melaSwaram':
                                              '${controller.melaRagam[index].swaram}'
                                        });
                                        //cartControler.addToCart(controler.products[index]);
                                      },
                                      // color: Colors.blue,
                                      //textColor: Colors.white,
                                      child: Text("Sub Ragams"),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      )
                    : Container(
                      height:50,
                      width: 50,
                        margin: EdgeInsets.all(100),
                        child: CircularProgressIndicator(
                          //value: 0.5,
                          backgroundColor: Colors.grey,
                          color: Colors.purple,
                          strokeWidth: 3,
                        ),
                      );
              }),
            ),
            //Text(
            //  'total amount',
            //  style: TextStyle(color: Colors.black, fontSize: 30),
            //),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
