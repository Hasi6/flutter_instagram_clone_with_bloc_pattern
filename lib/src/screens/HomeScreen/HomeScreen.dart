import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  void onTapped(number) {
    setState(() {
      index = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Feed"),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
        bottomNavigationBar: BottomNavigationBar(
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
            currentIndex: index,
            selectedItemColor: Colors.greenAccent[400],
            onTap: onTapped),
      ),
    );
  }
}
