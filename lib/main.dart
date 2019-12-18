import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/Bloc/BottomBarNavigation/BottmNavigationProvider.dart';
import 'package:insta_clone/src/screens/HomeScreen/HomeScreen.dart';

main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => Provider(child: HomeScreen()),
      },
    ));
