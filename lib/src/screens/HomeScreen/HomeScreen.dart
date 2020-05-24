import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/Bloc/BottomBarNavigation/BottmNavigationProvider.dart';
import 'package:insta_clone/src/screens/HomeScreen/AppBar/AppBar.dart';
import 'package:insta_clone/src/screens/HomeScreen/BottomTab/BottomTab.dart';
import 'package:insta_clone/src/screens/HomeScreen/ChangeScreen/ChangeScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            height: 25.0,
            child: appBar(bloc),
          ),
          elevation: 1.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.camera_alt),
            color: Colors.black,
            onPressed: () => print("Hasi"),
          ),
          backgroundColor: Color(0xfff8faf8),
        ),
        body: StreamBuilder(
          stream: bloc.numbers,
          builder: (context, snapshot) {
            return changeScreen(snapshot.data, context);
          },
        ),
        bottomNavigationBar: bottomNavigation(bloc),
      ),
    );
  }
}
