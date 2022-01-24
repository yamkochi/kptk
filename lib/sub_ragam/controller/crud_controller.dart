import 'package:av_net_shop/sub_ragam/model/crud_message.dart';
import 'package:av_net_shop/sub_ragam/service/crud_service.dart';

import 'package:get/get.dart';

class CrudController extends GetxController {
  List<CrudMessage> crudMessage = <CrudMessage>[].obs;

  var isLoading = true.obs;
  // var melaNo = 0.obs;
  Map ragaData = {};
  updateRagaData(Map map) {
    // print('inside update value: $x');
    ragaData.assignAll(map);
    // print('updated janyaid: ${melaNo.value}');
  }

  void postSubRaga({required String task, required Map param}) async {
    try {
      isLoading(true);
      var receivedMessage =
          await CrudService.postSubRaga(task: task, param: param);

      crudMessage.assignAll(receivedMessage);
    } catch (e) {
      print('caught error 11111.$e');
      throw Exception();
    } finally {
      isLoading(false);
    }
  }
}
