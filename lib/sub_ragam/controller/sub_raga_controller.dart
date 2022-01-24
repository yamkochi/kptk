import 'package:av_net_shop/sub_ragam/service/data_service.dart';
import 'package:av_net_shop/sub_ragam/model/janya_ragam_model.dart';

import 'package:get/get.dart';

class SubRagaController extends GetxController {
  List<JanyaRagam> subRagam = <JanyaRagam>[].obs;

  var isLoading = true.obs;
  var melaNo = 0.obs;

  //@override
  //void onInit() {
  //  super.onInit();
  //  getRagam(
  //      task: 'getSubRaga.php',
  //      param: {'action': 'GET_ALL', 'mela_no': melaNo.toString()});
  //}

  updateJanyaId(var x) {
    print('inside update value: $x');
    melaNo.value = x;
    print('updated janyaid: ${melaNo.value}');
  }

  void getRagam({required String task, required Map param}) async {
    try {
      isLoading(true);
      var subRagams = await DataService.getRagam(task: task, param: param);

      subRagam.assignAll(subRagams);
    } catch (e) {
       print('caught error 11111.$e');
      throw Exception();
     
    }
    
    
    finally {
      isLoading(false);
    }
  }
}
