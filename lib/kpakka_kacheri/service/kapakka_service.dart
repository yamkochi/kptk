

import 'package:av_net_shop/kpakka_kacheri/model/kpakkam_model.dart';
import 'package:http/http.dart' as http;

class KpakkaService  {
  static const String url = "http://yamkochi.in/music/";


  static var client = http.Client();
  static Future<List<Kpakkam>> getKpakkam({required String task, required Map param}) async {
   
  
      print("In side service.....11111");
      print('$task $param');
     
      var  response = await client.post(Uri.parse('$url$task'), body: param);
      if (response.statusCode == 200) {
        // print(response.body);
        return kpakkamFromJson(response.body);

        // print(melaragam[0].melaName);
        // print("In side service.....22222");
        
      } else {
        //throw ('error');
        //  print("In side service not 200");
        return List<Kpakkam>.empty();
      }
    
  }
}
