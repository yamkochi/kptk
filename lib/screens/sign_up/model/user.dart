// To parse this JSON data, do
//
//     final avsUser = avsUserFromJson(jsonString);

import 'dart:convert';

List<AvsUser> avsUserFromJson(String str) => List<AvsUser>.from(json.decode(str).map((x) => AvsUser.fromJson(x)));

String avsUserToJson(List<AvsUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AvsUser {
    AvsUser({
        required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.address,
    });

    String id;
    String firstName;
    String lastName;
    String email;
    String phoneNumber;
    String password;
    String address;

    factory AvsUser.fromJson(Map<String, dynamic> json) => AvsUser(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        password: json["password"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
        "password": password,
        "address": address,
    };
}
