import 'dart:async';
import 'package:insta_clone/src/Validators/AuthValidator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class RegisterBloc extends Object with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmpassword = BehaviorSubject<String>();

  // ADD DATA TO STREAMS
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<String> get confirmPassword =>
      _confirmpassword.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Observable.combineLatest3(email, password, confirmPassword,
          (email, password, confirmPassword) {
        if (password.toString() == confirmPassword.toString()) {
          return true;
        }
        return false;
      });

  // CHANGE DATA
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeConfirmPassword => _confirmpassword.sink.add;

  void submitData() {
    print(_email.value);
    print(_password.value);
  }

  dispose() {
    _email.close();
    _password.close();
    _confirmpassword.close();
  }
}
