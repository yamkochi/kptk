import 'package:av_net_shop/upload_file/service/upload_file_service.dart';
import 'package:get/get.dart';

class UploadFileController extends GetxController {
  static const String url = "https://yamkochi.in/upload/uploadB.php";
  var uploadFile = UploadFileService();
  var filePath;
  var message;

  storeFile() async {
    filePath = await uploadFile.pickImage();
    message = await uploadFile.uploadImage(url, filePath);
    print(message);
  }
}
