import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/Bloc/BottomBarNavigation/BottmNavigationProvider.dart';
import 'package:insta_clone/src/Bloc/Feed/FeedProvider.dart';
import 'package:insta_clone/src/Bloc/Login/LoginProvider.dart';
import 'package:insta_clone/src/Bloc/Register/RegisterProvider.dart';
import 'package:insta_clone/src/Bloc/UploadImage/UploadImageProvider.dart';
import 'package:insta_clone/src/Bloc/UserDetails/UserDetailsProvider.dart';
import 'package:insta_clone/src/screens/HomeScreen/HomeScreen.dart';
import 'package:insta_clone/src/screens/Login/Login.dart';
import 'package:insta_clone/src/screens/Register/Register.dart';

main() => runApp(UserProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/register',
        routes: {
          '/': (context) => FeedProvider(
                child: Provider(
                    child: UploadPostProvider(
                  child: HomeScreen(),
                )),
              ),
          '/login': (context) => LoginProvider(
                child: Login(),
              ),
          '/register': (context) => RegisterProvider(
                child: Register(),
              ),
        },
      ),
    ));
