import 'package:av_net_shop/songs_of_raga/model/song_ragam_model.dart';

import 'package:http/http.dart' as http;

class DataService  {
  static const String url = "http://yamkochi.in/music/";


  static var client = http.Client();
  static Future<List<SongsRaga>> getSong({required String task, required Map param}) async {
   
  
      print("In side janya service....3333");
      print('$task --- $param');
     
      var  response = await client.post(Uri.parse('$url$task'), body: param);
      if (response.statusCode == 200) {
        // print(response.body);
        return songsRagaFromJson(response.body);

        // print(melaragam[0].melaName);
        // print("In side service.....22222");
        
      } else {
        //throw ('error');
        //  print("In side service not 200");
        return List<SongsRaga>.empty();
      }
    
  }
}
