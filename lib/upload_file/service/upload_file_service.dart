import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadFileService {
  

 // XFile? _imageFile;
 

  final ImagePicker _picker = ImagePicker();
  static var client = http.Client();

 

   Future<String?> uploadImage(url,fP) async {
   
       var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file', fP));
    var res = await request.send();

    return res.reasonPhrase;
  }


  Future<String?> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        // maxWidth: 200,
        //maxHeight: 200,
        // imageQuality: 50,
      );
      
      return pickedFile!.path;
    } 
    catch (e)
     {
      if (kDebugMode) {
        print('problem');
      }
    }
  }
}
  

/*
 XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
       // maxWidth: 200,
        //maxHeight: 200,
       // imageQuality: 50,
      );





Future<String?> uploadImage(filepath, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file', filepath));
    var res = await request.send();
    return res.reasonPhrase;



*/