import 'dart:convert';

class User {
  int id;
  String username;
  String email;
  String image;

  User.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    username = parsedJson["username"];
    email = parsedJson["email"];
    image = parsedJson["image"];
  }
}
