import 'package:flutter/material.dart';
import 'package:insta_clone/src/Bloc/Login/LoginBloc.dart';
import 'package:insta_clone/src/Bloc/Login/LoginProvider.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bloc = LoginProvider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailFiled(bloc),
          // passwordField(bloc),
          // submitbutton(bloc)
        ],
      )
    );
  }

  Widget emailFiled (LoginBloc bloc){
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot){
        return TextField(
          onChanged: bloc.changeEmail,
          decoration: InputDecoration(
            hintText: "example@example.com",
            labelText: "Email",
            errorText: snapshot.error
          ),
        );
      },
    );
  }

}