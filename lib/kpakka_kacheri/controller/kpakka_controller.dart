import 'package:av_net_shop/kpakka_kacheri/model/kpakkam_model.dart';
import 'package:av_net_shop/kpakka_kacheri/service/kapakka_service.dart';
import 'package:get/get.dart';

class KpakkamController extends GetxController {
  List<Kpakkam> kPakkam = <Kpakkam>[].obs;
  List<Kpakkam> kPakkamP = <Kpakkam>[].obs;
  List<Kpakkam> kPakkamF = <Kpakkam>[].obs;

  var isLoading = true.obs;

@override
void onInit() {
  super.onInit();
  getKpakkam(gp:'N',task: 'getKpakkam.php', param: {'action': 'NEXT'});
  getKpakkam(gp:'P',task: 'getKpakkam.php', param: {'action': 'PAST'});
  getKpakkam(gp:'F',task: 'getKpakkam.php', param: {'action': 'FUTURE'});
}

  void getKpakkam({required String gp ,required String task, required Map param}) async {
    try {
      print("anand");
      print(param);
      isLoading(true);
      var data = await KpakkaService.getKpakkam(task: task, param: param);
       if (gp=='N')
        kPakkam.assignAll(data);
        else if (gp=='P')
        kPakkamP.assignAll(data);
        else if (gp=='F')
        kPakkamF.assignAll(data);

    } finally {
      isLoading(false);
    }
  }
}
