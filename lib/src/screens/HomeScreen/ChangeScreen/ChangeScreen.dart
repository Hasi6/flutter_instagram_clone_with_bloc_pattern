import 'package:flutter/cupertino.dart';
import 'package:insta_clone/src/screens/HomeScreen/FeedScreen/FeedScreen.dart';
import 'package:insta_clone/src/screens/HomeScreen/UploadScreen/UploadScreen.dart';
import 'package:insta_clone/src/screens/HomeScreen/UserScreen/UserScreen.dart';

Widget changeScreen(index, context) {
  if (index == 1) {
    return uploadScreen(context);
  }
  if (index == 2) {
    return usersScreen();
  } else {
    return feedScreen();
  }
}
