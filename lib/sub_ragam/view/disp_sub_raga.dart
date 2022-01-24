// ignore_for_file: unnecessary_statements

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:av_net_shop/songs_of_raga/controller/song_raga_controller.dart';
import 'package:av_net_shop/songs_of_raga/view/disp_song_raga.dart';
import 'package:av_net_shop/sub_ragam/controller/crud_controller.dart';
import 'package:av_net_shop/sub_ragam/controller/sub_form_controller.dart';
import 'package:av_net_shop/sub_ragam/controller/sub_raga_controller.dart';
import 'package:av_net_shop/sub_ragam/view/add_sub_form.dart';
import 'package:av_net_shop/sub_ragam/view/edit_sub_form.dart';

class SubRagaPage extends StatelessWidget {
  final subRagaController = Get.put(SubRagaController());
  final songsRagaController = Get.put(SongsRagaController());
  final subFormController = Get.put(SubFormController());
  final crudController = Get.put(CrudController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent[700],
        title: Text(
          //Get.arguments['melaName'] ?? 'Janya Ragam',
          Get.arguments['melaName'] ?? 'Janya Ragam',
          style: TextStyle(color: Colors.green, fontSize: 25),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //  subRagaController
          //     .getRagam(task: 'getSubRaga.php', param: {'action': 'GET_ALL'});
          // Get.to(EditSubRaga());
          // Get.to(() => EditSubScreen());
          // Get.to(() => SubRagaPage(), arguments: {'melaName': '${controller.melaRagam[index].melaName}'});

          //Get.to(() => EditSubForm(),arguments: {'melaName': Get.arguments['melaName'] ?? 'Janya Ragam',
          // 'melaNo':Get.arguments['melaNo'] ?? '00'});
          Get.to(() => AddSubForm(), arguments: {
            'melaName': Get.arguments['melaName'] ?? 'Janya Ragam',
            'melaNo': Get.arguments['melaNo'] ?? '00',
            'melaSwaram': Get.arguments['melaSwaram'] ?? '00'
          });
        },
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.post_add,
          color: Colors.black,
        ),
        label: Text(
          //'Test..${melaController.melaRagam[0].melaName}',
          'Add a derived ragam',
          style: TextStyle(color: Colors.green, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<SubRagaController>(builder: (controller) {
                return subRagaController.isLoading.isFalse
                    ? ListView.builder(
                        itemCount: controller.subRagam.length,
                        itemBuilder: (context, index) {
                          return Card(
                              color: Colors.amberAccent[100],
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ElevatedButton.icon(
                                                onPressed:
                                                    ('${controller.subRagam[index].janyaId}' ==
                                                            '0')
                                                        ? () {
                                                            null;
                                                          }
                                                        : () {
                                                            Get.to(
                                                                () =>
                                                                    EditSubForm(),
                                                                arguments: {
                                                                  'melaNo':
                                                                      '${controller.subRagam[index].melaNo}',
                                                                  'janyaNo':
                                                                      '${controller.subRagam[index].janyaId}',
                                                                  'ragaNo':
                                                                      '${controller.subRagam[index].ragaNo}',
                                                                  'ragaName':
                                                                      '${controller.subRagam[index].ragaName}',
                                                                  'aroganam':
                                                                      '${controller.subRagam[index].aroganam}',
                                                                  'avaroganam':
                                                                      '${controller.subRagam[index].avaroganam}',
                                                                  'audio_path':
                                                                      '${controller.subRagam[index].audioPath}',
                                                                  'srudhi':
                                                                      '${controller.subRagam[index].srudhi}',
                                                                  'contributor':
                                                                      '${controller.subRagam[index].contributor}',
                                                                  'melaName': Get
                                                                              .arguments[
                                                                          'melaName'] ??
                                                                      'Janya Ragam',
                                                                  'melaSwaram':
                                                                      Get.arguments[
                                                                              'melaSwaram'] ??
                                                                          'melswarm',
                                                                });
                                                          },
                                                label: Text(
                                                  //'${controller.subRagam[index].melaNo}',
                                                  '',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                icon: Icon(Icons.edit),
                                              ),
                                              ElevatedButton.icon(
                                                  icon: const Icon(
                                                      Icons.music_note),
                                                  label: Text(''),
                                                  onPressed:
                                                      ('${controller.subRagam[index].janyaId}' ==
                                                              '0')
                                                          ? () {
                                                              null;
                                                            }
                                                          : () {
                                                              songsRagaController
                                                                  .getSongs(
                                                                      task:
                                                                          'getSongs.php',
                                                                      param: {
                                                                    'action':
                                                                        'GET_ALL',
                                                                    'janya_id':
                                                                        '${controller.subRagam[index].janyaId}'
                                                                  });

                                                              Get.to(
                                                                  () =>
                                                                      SongRagaPage(),
                                                                  arguments: {
                                                                    'subRaga':
                                                                        '${controller.subRagam[index].ragaName}',
                                                                    'janyaNo':
                                                                        '${controller.subRagam[index].janyaId}'
                                                                  });
                                                            }),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${controller.subRagam[index].ragaName}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              Text(
                                                '${controller.subRagam[index].aroganam}',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              Text(
                                                '${controller.subRagam[index].avaroganam}',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                            icon: const Icon(
                                                Icons.delete_forever),
                                            tooltip: 'Listen the Raga',
                                            onPressed:
                                                ('${controller.subRagam[index].janyaId}' ==
                                                        '0')
                                                    ? () {
                                                        null;
                                                      }
                                                    : () {
                                                        Get.defaultDialog(
                                                          title:
                                                              "You are deleting the Raga",
                                                          middleText:
                                                              "Hello world!",
                                                          backgroundColor:
                                                              Colors.green,
                                                          titleStyle: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          middleTextStyle:
                                                              TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                          textConfirm:
                                                              "Confirm",
                                                          textCancel: "Cancel",
                                                          cancelTextColor:
                                                              Colors.white,
                                                          confirmTextColor:
                                                              Colors.white,
                                                          buttonColor:
                                                              Colors.red,
                                                          barrierDismissible:
                                                              false,
                                                          radius: 50,
                                                          content: Column(
                                                            children: [
                                                              Container(
                                                                  child: Text(
                                                                      '${controller.subRagam[index].ragaName}')),
                                                              // Container(child:Text("Hello 2")),
                                                              //Container(child:Text("Hello 3")),
                                                            ],
                                                          ),
                                                          onConfirm: () {
                                                            crudController
                                                                .postSubRaga(
                                                                    task:
                                                                        'insertUpdateSubRaga.php',
                                                                    param: {
                                                                  'action':
                                                                      'DELETE',
                                                                  'janya_id':
                                                                      '${controller.subRagam[index].janyaId}'
                                                                });

                                                            Get.snackbar(
                                                              '-------',
                                                              '--------',
                                                              titleText: Text(
                                                                  'Delete Raga',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red)),
                                                              backgroundColor:
                                                                  Colors.black,
                                                              messageText:
                                                                  Obx(() {
                                                                return crudController
                                                                        .isLoading
                                                                        .isTrue
                                                                    ? Text(
                                                                        'loading',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.red),
                                                                      )
                                                                    : Text(
                                                                        crudController
                                                                            .crudMessage[
                                                                                0]
                                                                            .message,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.red));
                                                              }),
                                                            );
                                                          },
                                                        );
                                                      }),
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
            // Text(
            //   'Add a Subragam',
            //   style: TextStyle(color: Colors.black, fontSize: 30),
            // ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton(
      {required this.lbl, required this.ico, required this.press, Key? key})
      : super(key: key);

  final String lbl;
  final IconData ico;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(lbl),
      icon: Icon(ico),
      onPressed: () {
        press;
      },
    );
  }
}
