import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/Bloc/BottomBarNavigation/BottmNavigationProvider.dart';
import 'package:insta_clone/src/Bloc/BottomBarNavigation/BottomNavigationBloc.dart';
import 'package:insta_clone/src/screens/HomeScreen/PostsList/PostsList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Feed"),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
        body: PostsList(),
        bottomNavigationBar: bottomNavigation(bloc),
      ),
    );
  }

  Widget bottomNavigation(BottomNavigationBloc bloc) {
    return StreamBuilder(
      stream: bloc.numbers,
      builder: (context, snapshot) {
        return BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Feed'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.file_upload),
                title: Text('Upload'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('User'),
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
}
