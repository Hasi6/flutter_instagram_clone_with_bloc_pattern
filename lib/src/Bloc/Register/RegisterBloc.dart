import 'dart:async';
import 'package:insta_clone/src/Validators/AuthValidator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

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
  void submitData() {
    print(_email.value);
    print(_password.value);
  }

  dispose() {
    _username.close();
    _email.close();
    _password.close();
    _confirmpassword.close();
  }
}
