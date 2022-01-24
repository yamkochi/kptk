import 'package:av_net_shop/sub_ragam/controller/crud_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:get/get.dart';

//import 'package:form_builder_file_picker/form_builder_file_picker.dart';

class EditSubForm extends StatelessWidget {
  final CrudController crudController = Get.put(CrudController());

  final melaNo = "${Get.arguments['melaNo'] ?? 'MelNo'}";
  final melName = "${Get.arguments['melaName'] ?? 'MelName'}";
  final janyaNo = "${Get.arguments['janyaNo'] ?? 'janya No'}";
  final ragaNo = "${Get.arguments['ragaNo'] ?? 'raga No'}";
  final melaSwaram = "${Get.arguments['melaSwaram'] ?? 'MelaSwaram'}";
       // janyaId,
      
       // ragaNo,
   final  ragaName= "${Get.arguments['ragaName'] ?? 'nodata1'}";
   final  aroganam= "${Get.arguments['aroganam'] ?? 'nodata1'}";
   final  avaroganam= "${Get.arguments['avaroganam'] ?? 'nodata1'}";
   final  audioPath= "${Get.arguments['audioPath'] ?? 'nodata1'}";
   final  srudhi= "${Get.arguments['srudhi'] ?? 'nodata1'}";
   final  contributor= "${Get.arguments['contributor'] ?? 'nodata1'}";

  final Map map = {};

  EditSubForm({Key? key}) : super(key: key);

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
          'Edit raga  \n ($melaNo):$melName',
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
                  name: 'raga_name',
                  initialValue: ragaName,
                  decoration: InputDecoration(
                    labelText: 'Raga Name',
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
                name: 'aroganam',
                decoration: InputDecoration(
                  labelText: 'Aroganam',
                ),
                //  onChanged: (value) => print('chamged $value'),
                initialValue:aroganam,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                name: 'avaroganam',
                decoration: InputDecoration(
                  labelText: 'Avaroganam',
                ),
                //  onChanged: (value) => print('avaro chamged $value'),
                initialValue:avaroganam ,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),

          

              FormBuilderDropdown(
                name: 'srudhi',
                initialValue:srudhi ,
                decoration: InputDecoration(
                  labelText: 'Srudhi',
                ),
             
                allowClear: true,
                hint: Text('Select Srudhi'),
             
                items: srudhiOptions
                    .map((srudhi) => DropdownMenuItem(
                          value: srudhi,
                          child: Text('$srudhi'),
                        ))
                    .toList(),
                 onChanged: (value) => print('srudhichanged $value'),
              ),




              SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                readOnly: true,
                name: 'audio_path',
                initialValue: audioPath,
                decoration: InputDecoration(
                  labelText: 'action in server',
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
                          map.addAll({'mela_no': melaNo});
                           map.addAll({'janya_id': janyaNo});
                           map.addAll({'raga_no': ragaNo});



                           print(map);
                          // print(crudController.ragaData);

                          crudController.postSubRaga(
                              task: 'insertUpdateSubRaga.php', param: map);

                          Get.snackbar(
                            '-------',
                            '--------',
                            titleText: Text('Raga Data change',
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