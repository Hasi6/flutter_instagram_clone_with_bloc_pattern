import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/Bloc/BottomBarNavigation/BottomNavigationBloc.dart';

Widget bottomNavigation(BottomNavigationBloc bloc) {
  return StreamBuilder(
    stream: bloc.numbers,
    builder: (context, snapshot) {
      return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_upload),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text(''),
            ),
          ],
          currentIndex: snapshot.data,
          selectedItemColor: Colors.greenAccent[400],
          onTap: (i) {
            bloc.changeIndex(i);
          });
    },
  );
}
