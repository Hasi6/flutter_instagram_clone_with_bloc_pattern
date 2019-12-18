import 'dart:async';
import 'package:insta_clone/src/Validators/AuthValidator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class LoginBloc extends Object with Validators{
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // ADD DATA TO STREAMS
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (email, password) => true);

  // CHANGE DATA
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  void submitData () {
    print(this._email.value);
    print(this._password.value);
  }


  dispose(){
    _email.close();
    _password.close();
  }
}