import 'package:flutter/material.dart';
import 'package:insta_clone/src/Bloc/Register/RegisterBloc.dart';
import 'package:insta_clone/src/Bloc/Register/RegisterProvider.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = RegisterProvider.of(context);

    return Scaffold(
      body: Center(
          child: Container(
        margin: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            usernameField(bloc),
            Container(
              margin: EdgeInsets.only(top: 10.0),
            ),
            emailFiled(bloc),
            Container(
              margin: EdgeInsets.only(top: 10.0),
            ),
            passwordField(bloc),
            Container(
              margin: EdgeInsets.only(top: 10.0),
            ),
            confirmPasswordField(bloc),
            loginPage(context),
            submitbutton(bloc),
            displayErrors(bloc)
          ],
        ),
      )),
    );
  }

  // EMAIL FIELD
  Widget usernameField(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.username,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeUsername,
          decoration: InputDecoration(
              hintText: "example",
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

  // EMAIL FIELD
  Widget emailFiled(RegisterBloc bloc) {
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
  Widget passwordField(RegisterBloc bloc) {
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

  // PASSWORD FIELD
  Widget confirmPasswordField(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.confirmPassword,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          onChanged: bloc.changeConfirmPassword,
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

  Widget loginPage(BuildContext context) {
    return FlatButton(
      child: Text("Login Page"),
      onPressed: () => Navigator.pushReplacementNamed(context, "/login"),
    );
  }

  // SUBMIT BUTTON
  Widget submitbutton(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          disabledColor: Colors.red,
          child: Text("Regitser"),
          color: Colors.blueAccent,
          onPressed: snapshot.hasData ? () => bloc.submitData(context) : null,
        );
      },
    );
  }

  Widget displayErrors(RegisterBloc bloc) {
    return StreamBuilder(
        stream: bloc.error,
        builder: (context, snapshot) {
          return Center(
            child: Text(
              snapshot.hasData ? snapshot.data : "",
              style: TextStyle(color: Colors.red),
            ),
          );
        });
  }
}
