import 'package:av_net_shop/sub_ragam/controller/crud_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubFormController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  CrudController crudController = Get.put(CrudController());
  Map ragaData = {};

  late TextEditingController
  //melaNoController,
      ragaNameController,
      aroganamController,
      avaroganamController,
      audioPathController,
      srudhiController,
      contributorController;
  var melaNo = '';
  var ragaName = '';
  var aroganam = '';
  var avaroganam = '';
  var audioPath = '';
  var srudhi = '';
  var contributor = '';

  @override
  void onInit() {
    super.onInit();

   // melaNoController = TextEditingController();
    ragaNameController = TextEditingController();
    aroganamController = TextEditingController();
    avaroganamController = TextEditingController();
    audioPathController = TextEditingController();
    srudhiController = TextEditingController();
    contributorController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
   // melaNoController.dispose();
    ragaNameController.dispose();
    aroganamController.dispose();
    avaroganamController.dispose();
    audioPathController.dispose();
    srudhiController.dispose();
    contributorController.dispose();
  }

  //String? validateEmail(String value) {
  //  if (!GetUtils.isEmail(value)) {
  //    return "Provide valid Email";
  //  }
  //  return null;
  //}

  //String? validateMelaNo(String value) {
  //  if (value.isEmpty) {
  //   
  //    return "Please Enter MelaNo";
  //  }
  //  return null;
  //}

  String? validateRagaName(String value) {
    if (value.isEmpty) {
      return "Please Enter Raga Name";
    }
    return null;
  }

  String? validateAroganam(String value) {
    if (value.isEmpty) {
      return "Please Enter Aroganam";
    }
    return null;
  }

  String? validateAvaroganam(String value) {
    if (value.isEmpty) {
      return "Please Enter Avaroganam";
    }
    return null;
  }

  String? validateAudioPath(String value) {
    if (value.isEmpty) {
      return "Please Audio Path";
    }
    return null;
  }

  String? validateSrudhi(String value) {
    if (value.isEmpty || value.length > 2) {
      return "Enter Srudhi and only 2 characters";
    }
    return null;
  }

  String? validateContributor(String value) {
    if (value.isEmpty) {
      return "Please Enter Contributor";
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    //makeData();
    ragaData = {
      'action': 'INSERT',
      'mela_no': melaNo,
      'raga_name': ragaName,
      'aroganam': aroganam,
      'avaroganam': avaroganam,
      'audio_path': audioPath,
      'srudhi': srudhi,
      'contributor': contributor
    };

    crudController.postSubRaga(
        task: 'insertUpdateSubRaga.php', param: ragaData);
  }
}
