import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/Bloc/BottomBarNavigation/BottmNavigationProvider.dart';
import 'package:insta_clone/src/Bloc/Login/LoginProvider.dart';
import 'package:insta_clone/src/screens/HomeScreen/HomeScreen.dart';
import 'package:insta_clone/src/screens/Login/Login.dart';
import 'package:insta_clone/src/screens/Register/Register.dart';

main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/': (context) => Provider(child: HomeScreen()),
        '/login': (context) => LoginProvider(child: Login(),),
        '/register': (context) => Register(),
      },
    ));
