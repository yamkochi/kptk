// To parse this JSON data, do
//
//     final janyaRagam = janyaRagamFromJson(jsonString);

import 'dart:convert';

List<JanyaRagam> janyaRagamFromJson(String str) => List<JanyaRagam>.from(json.decode(str).map((x) => JanyaRagam.fromJson(x)));

String janyaRagamToJson(List<JanyaRagam> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JanyaRagam {
    JanyaRagam({
        required this.janyaId,
        required this.melaNo,
        required this.ragaNo,
        required this.ragaName,
        required this.aroganam,
        required this.avaroganam,
        required this.audioPath,
        required this.srudhi,
        required this.contributor,
    });

   String janyaId;
    String melaNo;
    String ragaNo;
    String ragaName;
    String aroganam;
    String avaroganam;
    String audioPath;
    String srudhi;
    String contributor;

    factory JanyaRagam.fromJson(Map<String, dynamic> json) => JanyaRagam(
        janyaId: json["janya_id"],
        melaNo: json["mela_no"],
        ragaNo: json["raga_no"],
        ragaName: json["raga_name"],
        aroganam: json["aroganam"],
        avaroganam: json["avaroganam"],
        audioPath: json["audio_path"],
        srudhi: json["srudhi"],
        contributor: json["contributor"],
    );

    Map<String, dynamic> toJson() => {
        "janya_id": janyaId,
        "mela_no": melaNo,
        "raga_no": ragaNo,
        "raga_name": ragaName,
        "aroganam": aroganam,
        "avaroganam": avaroganam,
        "audio_path": audioPath,
        "srudhi": srudhi,
        "contributor": contributor,
    };
}
