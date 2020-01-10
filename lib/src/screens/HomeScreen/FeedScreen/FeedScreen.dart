import 'package:flutter/cupertino.dart';
import 'package:insta_clone/src/Bloc/Feed/FeedProvider.dart';
import 'package:insta_clone/src/screens/HomeScreen/FeedScreen/FeedBody/FeedBody.dart';

Widget feedScreen() {
  return FeedProvider(
    child: FeedBody(),
  );
}
