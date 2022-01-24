import 'package:av_net_shop/sub_ragam/model/janya_ragam_model.dart';

import 'package:http/http.dart' as http;

class DataService {
  static const String url = "http://yamkochi.in/music/";

  static var client = http.Client();
  static Future<List<JanyaRagam>> getRagam(
      {required String task, required Map param}) async {
    try {
      // print("In side janya service....3333");
      // print('$task --- $param');

      var response = await client.post(Uri.parse('$url$task'), body: param);
      if (response.statusCode == 200) {
        // print(response.body);
        return janyaRagamFromJson(response.body);

        // print(melaragam[0].melaName);
        // print("In side service.....22222");

      } else {
        print('No data');
        print(response.body);
        return List<JanyaRagam>.empty();
      }
    } catch (e) {
       print('caught error.$e');
      throw Exception();
     
    }
  }
}
