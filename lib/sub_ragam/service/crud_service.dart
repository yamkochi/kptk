
import 'package:av_net_shop/sub_ragam/model/crud_message.dart';
import 'package:http/http.dart' as http;

class CrudService {
  static const String url = "http://yamkochi.in/music/";

  static var client = http.Client();
  static Future<List<CrudMessage>> postSubRaga(
      {required String task, required Map param}) async {
    try {
       print("In side janya service....3333");
       print('$task --- $param');

      var response = await client.post(Uri.parse('$url$task'), body: param);
      if (response.statusCode == 200) {
        // print(response.body);
        return crudMessageFromJson(response.body);

        // print(melaragam[0].melaName);
        // print("In side service.....22222");

      } else {
        print('No data');
        print(response.body);
        return List<CrudMessage>.empty();
      }
    } catch (e) {
       print('caught error.$e');
      throw Exception();
     
    }
  }
}
