import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/Bloc/BottomBarNavigation/BottomNavigationBloc.dart';

Widget appBar(BottomNavigationBloc bloc) {
  return StreamBuilder(
    stream: bloc.numbers,
    builder: (context, snapshot) {
      if (snapshot.data == 0) {
        return Text("Feed", style: TextStyle(color: Colors.black));
      }
      if (snapshot.data == 1) {
        return Text("Upload", style: TextStyle(color: Colors.black));
      } else {
        return Text("User", style: TextStyle(color: Colors.black));
      }
    },
  );
}
