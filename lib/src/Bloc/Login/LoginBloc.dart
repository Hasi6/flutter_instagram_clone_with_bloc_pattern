import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:insta_clone/src/Validators/AuthValidator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:insta_clone/src/config/config.dart' as config;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
final userRef = FirebaseDatabase.instance.reference().child("users");

class LoginBloc extends Object with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // ADD DATA TO STREAMS
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (email, password) => true);

  // CHANGE DATA
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  void submitData() {
    print(_email.value);
    print(_password.value);
  }

  // LOGIN
  void login() {
    print("Login");
  }

  // GOOGLE SIGN IN
  Future googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential authCredential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    final AuthResult authResult =
        await _auth.signInWithCredential(authCredential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    var body = jsonEncode({
      'username': user.displayName,
      'email': user.email,
      'signInMethod': 'google',
    });

    http.Response response = await http.post("${config.endPoint}/addUser",
        body: body, headers: config.headers);
    print(user.photoUrl);
    userRef.child(user.uid).set({
      'username': user.displayName,
      'signInMethod': 'Google',
      'image': user.photoUrl
    });
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
