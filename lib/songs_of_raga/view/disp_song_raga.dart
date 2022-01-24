import 'package:av_net_shop/songs_of_raga/controller/song_raga_controller.dart';
import 'package:av_net_shop/songs_of_raga/view/add_song_raga.dart';
import 'package:av_net_shop/songs_of_raga/view/edit_song_raga.dart';
import 'package:av_net_shop/sub_ragam/controller/crud_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongRagaPage extends StatelessWidget {
  final songsRagaController = Get.put(SongsRagaController());
  final crudController = Get.put(CrudController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text(Get.arguments['subRaga'] ?? 'Janya Ragam',
            style: TextStyle(color: Colors.red, fontSize: 25)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => AddSongForm(), arguments: {
            'ragaName': Get.arguments['subRaga'] ?? 'Janya Ragam',
            'janyaNo': Get.arguments['janyaNo'] ?? '00'
          });

          //songsRagaController
          //    .getSongs(task: 'getSubRaga.php', param: {'action': 'GET_ALL'});
        },
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        label: Text(
          'Add a Song ',
          style: TextStyle(color: Colors.green, fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<SongsRagaController>(builder: (controller) {
                return songsRagaController.isLoading.isFalse
                    ? ListView.builder(
                        itemCount: controller.songsOfRaga.length,
                        itemBuilder: (context, index) {
                          return Card(
                              color: Colors.green[100],
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed:
                                              ('${controller.songsOfRaga[index].janyaId}' ==
                                                      '0')
                                                  ? () {
                                                    
                                                    }
                                                  : () {
                                                      Get.to(
                                                          () => EditSongForm(),
                                                          arguments: {
                                                            'janyaNo':
                                                                '${controller.songsOfRaga[index].janyaId}',
                                                            'songNo':
                                                                '${controller.songsOfRaga[index].songNo}',
                                                            'songName':
                                                                '${controller.songsOfRaga[index].songName}',
                                                            'language':
                                                                '${controller.songsOfRaga[index].language}',
                                                            'song_path':
                                                                '${controller.songsOfRaga[index].songPath}',
                                                            'srudhi':
                                                                '${controller.songsOfRaga[index].srudhi}',
                                                            'contributor':
                                                                '${controller.songsOfRaga[index].contributor}',
                                                            'ragaName': Get
                                                                        .arguments[
                                                                    'subRaga'] ??
                                                                'Janya Ragam',
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
                                        
                                        
                                       //ElevatedButton.icon(
                                       //    icon: const Icon(Icons.music_note),
                                       //    label: Text(''),
                                       //    onPressed:
                                       //        ('${controller.subRagam[index].janyaId}' ==
                                       //                '0')
                                       //            ? () {
                                       //                null;
                                       //              }
                                       //            : () {
                                       //                songsRagaController
                                       //                    .getSongs(
                                       //                        task:
                                       //                            'getSongs.php',
                                       //                        param: {
                                       //                      'action':
                                       //                          'GET_ALL',
                                       //                      'janya_id':
                                       //                          '${controller.subRagam[index].janyaId}'
                                       //                    });

                                       //                Get.to(
                                       //                    () =>
                                       //                        SongRagaPage(),
                                       //                    arguments: {
                                       //                      'subRaga':
                                       //                          '${controller.subRagam[index].ragaName}',
                                       //                      'janyaNo':
                                       //                          '${controller.subRagam[index].janyaId}'
                                       //                    });
                                       //              }),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '${controller.songsOfRaga[index].songName}',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.red,
                                              ),
                                              // overflow:TextOverflow.ellipsis ,
                                            ),
                                            Text(
                                              '${controller.songsOfRaga[index].language}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                                icon: const Icon(
                                                    Icons.delete_forever),
                                                tooltip: 'delete the song',
                                                onPressed:
                                                    ('${controller.songsOfRaga[index].janyaId}' ==
                                                            '0')
                                                        ? () {
                                                            // ignore: unnecessary_statements
                                                            null;
                                                          }
                                                        : () {
                                                            Get.defaultDialog(
                                                              title:
                                                                  "You are deleting the Song",
                                                              middleText:
                                                                  "Hello world!",
                                                              backgroundColor:
                                                                  Colors.green,
                                                              titleStyle: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                              middleTextStyle:
                                                                  TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                              textConfirm:
                                                                  "Confirm",
                                                              textCancel:
                                                                  "Cancel",
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
                                                                          '${controller.songsOfRaga[index].songName}')),
                                                                  // Container(child:Text("Hello 2")),
                                                                  //Container(child:Text("Hello 3")),
                                                                ],
                                                              ),
                                                              onConfirm: () {
                                                                crudController
                                                                    .postSubRaga(
                                                                        task:
                                                                            'insertUpdateSongRaga.php',
                                                                        param: {
                                                                      'action':
                                                                          'DELETE',
                                                                      'janya_id':
                                                                          '${controller.songsOfRaga[index].janyaId}',
                                                                      'song_no':
                                                                          '${controller.songsOfRaga[index].songNo}'
                                                                    });

                                                                Get.snackbar(
                                                                  '-------',
                                                                  '--------',
                                                                  titleText: Text(
                                                                      'Delete Raga',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red)),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .black,
                                                                  messageText:
                                                                      Obx(() {
                                                                    return crudController
                                                                            .isLoading
                                                                            .isTrue
                                                                        ? Text(
                                                                            'loading',
                                                                            style:
                                                                                TextStyle(color: Colors.red),
                                                                          )
                                                                        : Text(
                                                                            crudController.crudMessage[0].message,
                                                                            style: TextStyle(color: Colors.red));
                                                                  }),
                                                                );
                                                              },
                                                            );
                                                          }),
                                            IconButton(
                                                icon: const Icon(
                                                    Icons.note_add_outlined),
                                                tooltip:
                                                    'Increase volume by 10',
                                                onPressed: () {}),
                                          ],
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
    );
  }
}
