// To parse this JSON data, do
//
//     final melaRagam = melaRagamFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

List<MelaRagam> melaRagamFromJson(String str) => List<MelaRagam>.from(json.decode(str).map((x) => MelaRagam.fromJson(x)));

String melaRagamToJson(List<MelaRagam> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MelaRagam {
    MelaRagam({
        required this.chakraNo,
        required this.chakraName,
        required this.melaNo,
        required this.melaName,
        required this.swaram,
    });

      String chakraNo;
    String chakraName;
    String melaNo;
    String melaName;
    String swaram;

    factory MelaRagam.fromJson(Map<String, dynamic> json) => MelaRagam(
       
        chakraNo: json["chakra_no"],
        chakraName: json["chakra_name"],
        melaNo: json["mela_no"],
        melaName: json["mela_name"],
        swaram: json["swaram"],
    );

    Map<String, dynamic> toJson() => {
        
        "chakra_no": chakraNo,
        "chakra_name": chakraName,
        "mela_no": melaNo,
        "mela_name": melaName,
        "swaram": swaram,
    };
}
