
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String email;
  String password;
  String firstname;
  String lastname;

  UserModel({
    this.email,
    this.password,
    this.firstname,
    this.lastname,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    password: json["password"],
    firstname: json["firstname"],
    lastname: json["lastname"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "firstname": firstname,
    "lastname": lastname,
  };
}
