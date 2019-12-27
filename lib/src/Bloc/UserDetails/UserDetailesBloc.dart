import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:insta_clone/src/models/User.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:http/http.dart' as http;
import 'package:insta_clone/src/config/config.dart' as config;

final FirebaseAuth _auth = FirebaseAuth.instance;

class UserBloc {
  final _username = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _id = BehaviorSubject<String>();
  final _image = BehaviorSubject<String>();
  final _user = BehaviorSubject<User>();

  // ADD DATA TO STREAMS
  Stream<String> get username => _username.stream;
  Stream<String> get email => _email.stream;
  Stream<String> get id => _id.stream;
  Stream<String> get image => _image.stream;
  Stream<User> get user => _user.stream;

  // CHANGE DATA
  Function(String) get changeUsername => _username.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changeId => _id.sink.add;
  Function(String) get changeImage => _image.sink.add;
  Function(User) get changeUser => _user.sink.add;

  UserBloc() {
    WidgetsFlutterBinding.ensureInitialized();
    getUserData();
  }

  Future<FirebaseUser> getUserData() async {
    var user = await _auth.currentUser();
    if (user != null) {
      changeEmail(user.email.toString());
      http.Response response =
          await http.get("${config.endPoint}/user/${user.email.toString()}");
      User userModel = User.fromJson(jsonDecode(response.body));
      print(userModel.id);
      changeId(userModel.id);
      changeUser(userModel);
      print(_user.value.email);
    }
  }

  dispose() {
    _username.close();
    _email.close();
    _id.close();
    _image.close();
    _user.close();
  }
}
