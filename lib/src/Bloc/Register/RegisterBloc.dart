import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insta_clone/src/Validators/AuthValidator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:http/http.dart' as http;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
final userRef = FirebaseDatabase.instance.reference().child("users");

const endPoint = 'http://192.168.8.103:5000/addUser';

class RegisterBloc extends Object with Validators {
  final _username = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmpassword = BehaviorSubject<String>();

  // ADD DATA TO STREAMS
  Stream<String> get username => _username.stream;
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
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

  // REGISTER USER
  void submitData(BuildContext context) async {
    // _auth.createUserWithEmailAndPassword(
    //       email: _email.value, password: _password.value);
    //   final FirebaseUser newUser = user.user;
    //   await userRef.child(newUser.uid).set({
    //     'username': _username.value,
    //     'signInMethod': 'Email',
    //     'image': "user.photoUrl"
    //   });
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      String json =
          '{"username": "${_username.value}", "signInMethod}":"Email", "email":"${_email.value}"';
      http.Response response =
          await http.post(endPoint, headers: headers, body: json);
      // name
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      AlertDialog(
        title: Text("data"),
      );
    }
  }

  dispose() {
    _username.close();
    _email.close();
    _password.close();
    _confirmpassword.close();
  }
}
