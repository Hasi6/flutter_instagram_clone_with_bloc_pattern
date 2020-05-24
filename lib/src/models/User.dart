import 'dart:convert';

class User {
  String id;
  String username;
  String email;
  String image;
  String signInMethod;

  User.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['_id'];
    username = parsedJson["username"];
    email = parsedJson["email"];
    image = parsedJson["image"];
    signInMethod = parsedJson['signInMethod'];
  }
}
