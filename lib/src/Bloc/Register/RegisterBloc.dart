import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/Validators/AuthValidator.dart';
import 'package:insta_clone/src/config/config.dart' as config;
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:http/http.dart' as http;

final FirebaseAuth _auth = FirebaseAuth.instance;
final userRef = FirebaseDatabase.instance.reference().child("users");

class RegisterBloc extends Object with Validators {
  final _username = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmpassword = BehaviorSubject<String>();
  final _error = BehaviorSubject<String>();

  // ADD DATA TO STREAMS
  Stream<String> get username => _username.stream;
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<String> get error => _error.stream;
  Stream<String> get confirmPassword =>
      _confirmpassword.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest4(
      username,
      email,
      password,
      confirmPassword,
      (username, semail, password, confirmPassword) => true);

  // CHANGE DATA
  Function(String) get changeUsername => _username.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeConfirmPassword => _confirmpassword.sink.add;
  Function(String) get changeError => _error.sink.add;

  // REGISTER USER
  void submitData(BuildContext context) async {
    //   final FirebaseUser newUser = user.user;
    //   await userRef.child(newUser.uid).set({
    //     'username': _username.value,
    //     'signInMethod': 'Email',
    //     'image': "user.photoUrl"
    //   });

    changeError(null);

    try {
      print(config.endPoint);
      var user = await _auth.createUserWithEmailAndPassword(
          email: _email.value, password: _password.value);
      print(user.toString());

      var body = jsonEncode({
        'username': _username.value,
        'email': _email.value,
        'signInMethod': 'email',
      });

      http.Response response = await http.post("${config.endPoint}/addUser",
          body: body, headers: config.headers);

      print(jsonDecode(response.body).toString());
      // name
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      print(e.toString());
      print(e.toString());
      changeError(e.toString());
    }
  }

  dispose() {
    _username.close();
    _email.close();
    _password.close();
    _confirmpassword.close();
    _error.close();
  }
}
