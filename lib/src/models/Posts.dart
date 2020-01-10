import 'dart:convert';

import 'package:insta_clone/src/models/User.dart';

class Post {
  String id;
  User user;
  String location;
  String caption;
  String image;

  Post.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['_id'];
    location = parsedJson["location"];
    image = parsedJson["image"];
    // user = User.fromJson(jsonDecode(parsedJson['user']));
    caption = parsedJson['caption'];
  }
}
