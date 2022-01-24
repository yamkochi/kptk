// To parse this JSON data, do
//
//     final kpakkam = kpakkamFromJson(jsonString);


import 'dart:convert';

List<Kpakkam> kpakkamFromJson(String str) => List<Kpakkam>.from(json.decode(str).map((x) => Kpakkam.fromJson(x)));

String kpakkamToJson(List<Kpakkam> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kpakkam {
    Kpakkam({
        required this.kid,
        required this.topic,
        required this.dok,
        required this.uid,
        required this.detail,
        required this.poster,
    });

    String kid;
    String topic;
    DateTime dok;
    String uid;
    String detail;
    String poster;

    factory Kpakkam.fromJson(Map<String, dynamic> json) => Kpakkam(
        kid: json["kid"],
        topic: json["topic"],
        dok: DateTime.parse(json["dok"]),
        uid: json["uid"],
        detail: json["detail"],
        poster: json["poster"],
    );

    Map<String, dynamic> toJson() => {
        "kid": kid,
        "topic": topic,
        "dok": "${dok.year.toString().padLeft(4, '0')}-${dok.month.toString().padLeft(2, '0')}-${dok.day.toString().padLeft(2, '0')}",
        "uid": uid,
        "detail": detail,
        "poster": poster,
    };
}
