import 'package:flutter/cupertino.dart';
import 'package:insta_clone/src/Bloc/Feed/FeedProvider.dart';
import 'package:insta_clone/src/Bloc/GooglePlaces/GooglePlacesProvider.dart';
import 'package:insta_clone/src/Bloc/UserDetails/UserDetailsProvider.dart';
import 'package:insta_clone/src/screens/HomeScreen/FeedScreen/FeedScreen.dart';
import 'package:insta_clone/src/screens/HomeScreen/UploadScreen/UploadScreen.dart';
import 'package:insta_clone/src/screens/HomeScreen/UserScreen/UserScreen.dart';

Widget changeScreen(index, context) {
  if (index == 1) {
    return GooglePlacesProvider(
      child: UploadScreen(),
    );
  }
  if (index == 2) {
    return feedScreen();
  } else {
    return UserProvider(child: usersScreen(context));
  }
}
