import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget uploadScreen() {
  return Scaffold(
    body: Container(
      height: 42.0,
      child: TextField(
        decoration: InputDecoration(
            hintText: "Places",
            hintStyle: TextStyle(fontSize: 16, color: Colors.black),
            prefixIcon: Icon(Icons.place)),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.arrow_upward),
      tooltip: "Hasi",
      onPressed: () {},
    ),
  );
}
