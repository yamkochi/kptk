// To parse this JSON data, do
//
//     final janyaRagam = janyaRagamFromJson(jsonString);

import 'dart:convert';

List<CrudMessage> crudMessageFromJson(String str) => List<CrudMessage>.from(json.decode(str).map((x) => CrudMessage.fromJson(x)));

String crudMessageToJson(List<CrudMessage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CrudMessage {
    CrudMessage({
        required this.status,
        required this.message,
        
    });

   String status;
    String message;
   

    factory CrudMessage.fromJson(Map<String, dynamic> json) => CrudMessage(
        status: json["status"],
        message: json["message"],
       
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
       
    };
}
