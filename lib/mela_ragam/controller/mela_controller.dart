import 'package:av_net_shop/mela_ragam/model/mela_ragam.dart';
import 'package:av_net_shop/mela_ragam/service/data_service.dart';

import 'package:get/get.dart';

class MelaController extends GetxController {
//https://yamkochi.in/music/getMela.php

  List<MelaRagam> melaRagam = <MelaRagam>[].obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getRagams(task: 'getMela.php', param: {'action': 'GET_ALL'});
  }

  void getRagams({required String task, required Map param}) async {
    try {
      isLoading(true);
      var melaRagams = await DataService.getRagam(task: task, param: param);

      melaRagam.assignAll(melaRagams);
    } finally {
      isLoading(false);
    }
  }
}
