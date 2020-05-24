import 'package:flutter/material.dart';
import 'package:insta_clone/src/Bloc/Login/LoginBloc.dart';
import 'package:insta_clone/src/Bloc/Login/LoginProvider.dart';
import 'package:insta_clone/src/Bloc/UserDetails/UserDetailsProvider.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);
    final userBloc = UserProvider.of(context);

    userBloc.getUserData(context);

    return Scaffold(
      body: Center(
        child: Container(
            margin: EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                emailFiled(bloc),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                ),
                passwordField(bloc),
                submitbutton(bloc),
                registerPage(context),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                ),
                googleSignIn(bloc)
              ],
            )),
      ),
    );
  }

  // EMAIL FIELD
  Widget emailFiled(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.changeEmail,
          decoration: InputDecoration(
              hintText: "example@example.com",
              hintStyle: TextStyle(fontSize: 16, color: Colors.black),
              prefixIcon: Icon(Icons.email),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              fillColor: Colors.grey,
              filled: true,
              errorText: snapshot.error),
        );
      },
    );
  }

  // PASSWORD FIELD
  Widget passwordField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
              hintText: "********",
              hintStyle: TextStyle(fontSize: 16, color: Colors.black),
              prefixIcon: Icon(Icons.lock),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              fillColor: Colors.grey,
              filled: true,
              errorText: snapshot.error),
        );
      },
    );
  }

  // SUBMIT BUTTON
  Widget submitbutton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          disabledColor: Colors.red,
          child: Text("Login"),
          color: Colors.blueAccent,
          onPressed: snapshot.hasData ? () => bloc.submitData() : null,
        );
      },
    );
  }

  Widget registerPage(BuildContext context) {
    return FlatButton(
      child: Text("Register page"),
      onPressed: () => Navigator.pushReplacementNamed(context, "/register"),
    );
  }

  Widget googleSignIn(LoginBloc bloc) {
    return StreamBuilder(
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text("Google Sign In"),
          color: Colors.blueAccent,
          onPressed: () => bloc.googleSignIn(),
        );
      },
    );
  }
}
