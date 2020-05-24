import 'dart:async';
import 'package:email_validator/email_validator.dart';


class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink){
    if(EmailValidator.validate(email)){
      sink.add(email);
    }else{
      sink.addError("Enter a Valid Email");
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(handleData: (password, sink){
    if(password.length > 7 && password.length < 21){
      sink.add(password);
    }else{
      sink.addError("Enter Password at Length is 8 to 20");
    }
  });
}