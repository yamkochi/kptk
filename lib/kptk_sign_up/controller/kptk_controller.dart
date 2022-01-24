import 'package:av_net_shop/kptk_login/model/kptk_users.dart';
import 'package:av_net_shop/kptk_login/service/ktpk_service.dart';
import 'package:get/get.dart';

class KtpkController extends GetxController {
  KtpkServices service = KtpkServices();

  List<RagaUsers> ragaUsers = <RagaUsers>[].obs;

  var isLoading = true.obs;

  //@override
  //void onInit() {
  //  super.onInit();
  //  getUser(task: 'getUsers.php', param: {'action': 'GET_ALL'});
  //}

  Future<void> getUsers({required String task, required Map param}) async {
    try {
      isLoading(true);
       ragaUsers = await service.getUser(task: task, param: param);
     // ragaUsers.addAll(ragaUser);
    } finally {
      isLoading(false);
    }
  }
}






//Future<void> startService() async {
//  
//   map = {'mail': email, 'password': password};
//   
//   await serviceController.getUser(task: 'getUser2.php', param: map);
//  
//rint("after user verification");
//   //data = {
//   //  'first_name': serviceController.users[0].firstName,
//   //  'last_name': serviceController.users[0].lastName
//   //};
//  // Navigator.pushNamed(context, LoginSuccessScreen.routName, arguments: data);
//   Get.to(()=>LoginSuccessScreen());
// }