import 'package:flutter/cupertino.dart';
import 'package:insta_clone/src/Bloc/BottomBarNavigation/BottomNavigationBloc.dart';

Widget appBar(BottomNavigationBloc bloc) {
  return StreamBuilder(
    stream: bloc.numbers,
    builder: (context, snapshot) {
      if (snapshot.data == 0) {
        return Text("Feed");
      }
      if (snapshot.data == 1) {
        return Text("Upload");
      } else {
        return Text("User");
      }
    },
  );
}
