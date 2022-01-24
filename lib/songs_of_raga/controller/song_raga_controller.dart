import 'package:av_net_shop/songs_of_raga/model/song_ragam_model.dart';
import 'package:av_net_shop/songs_of_raga/service/data_service.dart';

import 'package:get/get.dart';

class SongsRagaController extends GetxController {
  List<SongsRaga> songsOfRaga= <SongsRaga>[].obs;

  var isLoading = true.obs;
  var janyaId = 0.obs;

  //@override
  //void onInit() {
  //  super.onInit();
  //  getRagam(
  //      task: 'getSubRaga.php',
  //      param: {'action': 'GET_ALL', 'mela_no': melaNo.toString()});
  //}

  updateJanyaId(var x) {
    print('inside update value: $x');
    janyaId.value = x;
    print('updated janyaid: ${janyaId.value}');
  }

  void getSongs({required String task, required Map param}) async {
    try {
      isLoading(true);
      var subRagams = await DataService.getSong(task: task, param: param);

      songsOfRaga.assignAll(subRagams);
    } finally {
      isLoading(false);
    }
  }
}
