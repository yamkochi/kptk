import 'package:av_net_shop/sub_ragam/controller/crud_controller.dart';
import 'package:av_net_shop/upload_file/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

//import 'package:form_builder_file_picker/form_builder_file_picker.dart';

class EditSongForm extends StatelessWidget {
  final CrudController crudController = Get.put(CrudController());
  final UploadFileController uploadController = Get.put(UploadFileController());

  final janyaNo = "${Get.arguments['janyaNo'] ?? 'JanyaId'}";
  final ragaName = "${Get.arguments['ragaName'] ?? 'Sub raga Name'}";

  final songNo = "${Get.arguments['songNo'] ?? 'song No'}";
  final songName = "${Get.arguments['songName'] ?? 'song No'}";

  final language = "${Get.arguments['language'] ?? 'language'}";
  final songPath = "${Get.arguments['song_path'] ?? 'songPath'}";
  final srudhi = "${Get.arguments['srudhi'] ?? 'srudhi'}";
  final contributor = "${Get.arguments['contributor'] ?? 'contributor'}";

  final Map map = {};

  EditSongForm({Key? key}) : super(key: key);

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  final List<String> srudhiOptions = [
    'C',
    'C#',
    'D',
    'D#',
    'E',
    'F',
    'F#',
    'G',
    'G#',
    'A',
    'A#',
    'B'
  ];
  //final PlatformFile myAudio ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Song for \n ($janyaNo):$ragaName',
          style: TextStyle(fontSize: 20, color: Colors.red[400]),
        ),
      ),
      body: FormBuilder(
        // skipDisabled: true,
        key: _fbKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                  name: 'song_name',
                  initialValue: songName,
                  decoration: InputDecoration(
                    labelText: 'Song Name',
                  ),
                  onChanged: (value) => print('Anand changed $value'),
                  onSaved: (value) => print('Anand saved $value'),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null) {
                      return ('enter raganame');
                    }
                    return null;
                  }),
              SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                name: 'language',
                decoration: InputDecoration(
                  labelText: 'Langauge',
                ),
                //  onChanged: (value) => print('chamged $value'),
                initialValue: language,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              FormBuilderDropdown(
                name: 'srudhi',
                initialValue: srudhi,
                decoration: InputDecoration(
                  labelText: 'Srudhi',
                ),
                // initialValue: 'Male',
                allowClear: true,
                hint: Text('Select Srudhi'),
                // validator: FormBuilderValidators.compose(
                //    [FormBuilderValidators.required(context)]),
                items: srudhiOptions
                    .map((srudhi) => DropdownMenuItem(
                          value: srudhi,
                          child: Text('$srudhi'),
                        ))
                    .toList(),
                // onChanged: (value) => print('srudhichanged $value'),
              ),
              SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                readOnly: true,
                name: 'song_path',
                initialValue: songPath,
                decoration: InputDecoration(
                  labelText: 'song_path',
                ),
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                name: 'contributor',
                decoration: InputDecoration(
                  labelText: 'Contributor',
                ),
                //  onChanged: (value) => print('chamged $value'),
                initialValue: contributor,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    uploadController.storeFile();
                  },
                  child: Text('Add a Song')),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        if (_fbKey.currentState!.saveAndValidate()) {
                          // print(_fbKey.currentState?.value);
                          //crudController.ragaData = _fbKey.currentState!.value;
                          map.addAll(_fbKey.currentState!.value);
                          map.addAll({'action': 'UPDATE'});
                          map.addAll({'janya_id': janyaNo});
                          map.addAll({'song_no': songNo});
                          print(map);
                          // print(crudController.ragaData);

                          crudController.postSubRaga(
                              task: 'insertUpdateSongRaga.php', param: map);

                          Get.snackbar(
                            '-------',
                            '--------',
                            titleText: Text('New Song',
                                style: TextStyle(color: Colors.red)),
                            backgroundColor: Colors.black,
                            messageText: Obx(() {
                              return crudController.isLoading.isTrue
                                  ? Text(
                                      'loading',
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : Text(crudController.crudMessage[0].message,
                                      style: TextStyle(color: Colors.red));
                            }),
                          );
                        }
                      },
                      child: Text('submit')),
                  ElevatedButton(
                      onPressed: () {
                        _fbKey.currentState?.reset();
                      },
                      child: Text('reset')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


//String reverseStringUsingSplit(String input) {
//  var chars = input.split('');
//  return chars.reversed.join();
//}