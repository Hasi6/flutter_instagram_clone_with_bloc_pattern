import 'dart:convert';

import 'package:insta_clone/src/models/User.dart';

class Post {
  String id;
  User user;
  String location;
  String caption;
  String image;

  Post.fromJson(Map<String, dynamic> parsedJson) {
    // print(User.fromJson(jsonDecode(parsedJson['user'])));
    id = parsedJson['_id'];
    location = parsedJson["location"];
    image = parsedJson["image"];
    // user = parsedJson['user'];
    caption = parsedJson['caption'];
  }
}
