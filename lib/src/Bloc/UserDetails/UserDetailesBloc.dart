import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class UserBloc {
  final _username = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _id = BehaviorSubject<String>();
  final _image = BehaviorSubject<String>();
  final _user = BehaviorSubject<Map>();

  // ADD DATA TO STREAMS
  Stream<String> get username => _username.stream;
  Stream<String> get email => _email.stream;
  Stream<String> get id => _id.stream;
  Stream<String> get image => _image.stream;
  Stream<Map> get user => _user.stream;

  // CHANGE DATA
  Function(String) get changeUsername => _username.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changeId => _id.sink.add;
  Function(String) get changeImage => _image.sink.add;
  Function(Map) get changeUser => _user.sink.add;

  dispose() {
    _username.close();
    _email.close();
    _id.close();
    _image.close();
    _user.close();
  }
}
