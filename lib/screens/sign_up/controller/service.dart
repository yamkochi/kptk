import 'package:av_net_shop/screens/sign_up/model/user.dart';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class Services extends GetxController {
  static const String url = "http://yamkochi.in/av_shop/";

 List<AvsUser> users = <AvsUser>[].obs;

   Future getUser(
      {required String task, required Map param}) async {

  // List<AvsUser> users = <AvsUser>[].obs;
    

    var client = http.Client();
    try {
      //  print("In side service.....11111");
      print(param);
      final response = await client.post(Uri.parse('$url$task'), body: param);
      if (response.statusCode == 200) {
        // print(response.body);
        users = avsUserFromJson(response.body);
        
        // print("In side service.....22222");
        //return null;
      } else {
        //  print("In side service not 200");
        return List<AvsUser>.empty();
      }
    } catch (e) {
      print("{error... $e}");
        
     // return List<AvsUser>.empty();
    }
  }
}
