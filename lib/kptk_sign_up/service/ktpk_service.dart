import 'package:av_net_shop/kptk_login/model/kptk_users.dart';
import 'package:http/http.dart' as http;

class KtpkServices {
  static const String url = "http://yamkochi.in/music/";

  Future<List<RagaUsers>> getUser(
      {required String task, required Map param}) async {
    var client = http.Client();
    try {
     
      final response = await client.post(Uri.parse('$url$task'), body: param);
      if (response.statusCode == 200) {
        
        return ragaUsersFromJson(response.body);
      } else {
        print("Anand..data not available");
        return List<RagaUsers>.empty();
      }
    } catch (e) {
      print("{error... $e}");
      return List<RagaUsers>.empty();
    }
  }
}
