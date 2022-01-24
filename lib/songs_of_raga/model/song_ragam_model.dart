// To parse this JSON data, do
//
//     final songsRaga = songsRagaFromJson(jsonString);

import 'dart:convert';

List<SongsRaga> songsRagaFromJson(String str) => List<SongsRaga>.from(json.decode(str).map((x) => SongsRaga.fromJson(x)));

String songsRagaToJson(List<SongsRaga> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SongsRaga {
    SongsRaga({
        required this.janyaId,
        required this.songNo,
        required this.songName,
        required this.language,
        required this.songPath,
        required this.srudhi,
        required this.contributor,
    });

    String janyaId;
    String songNo;
    String songName;
    String language;
    String songPath;
    String srudhi;
    String contributor;

    factory SongsRaga.fromJson(Map<String, dynamic> json) => SongsRaga(
        janyaId: json["janya_id"],
        songNo: json["song_no"],
        songName: json["song_name"],
        language: json["language"],
        songPath: json["song_path"],
        srudhi: json["srudhi"],
        contributor: json["contributor"],
    );

    Map<String, dynamic> toJson() => {
        "janya_id": janyaId,
        "song_no": songNo,
        "song_name": songName,
        "language": language,
        "song_path": songPath,
        "srudhi": srudhi,
        "contributor": contributor,
    };
}
