// To parse this JSON data, do
//
//     final ragaUsers = ragaUsersFromJson(jsonString);

import 'dart:convert';

List<RagaUsers> ragaUsersFromJson(String str) => List<RagaUsers>.from(json.decode(str).map((x) => RagaUsers.fromJson(x)));

String ragaUsersToJson(List<RagaUsers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RagaUsers {
    RagaUsers({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.password,
        required this.phoneNumber,
        required this.address,
        required this.photoPath,
    });

    String id;
    String firstName;
    String lastName;
    String email;
    String password;
    String phoneNumber;
    String address;
    String photoPath;

    factory RagaUsers.fromJson(Map<String, dynamic> json) => RagaUsers(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        photoPath: json["photo_path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "phone_number": phoneNumber,
        "address": address,
        "photo_path": photoPath,
    };
}
