import 'package:flutter/cupertino.dart';
import 'package:insta_clone/src/Bloc/UserDetails/UserDetailesBloc.dart';
import 'package:insta_clone/src/Bloc/UserDetails/UserDetailsProvider.dart';

Widget userImage(BuildContext context) {
  var bloc = UserProvider.of(context);
  return Container(
      margin: EdgeInsets.only(top: 20.0),
      height: 300,
      child: userDetails(bloc, context));
}

Widget userDetails(UserBloc bloc, BuildContext context) {
  return StreamBuilder(
    stream: bloc.user,
    builder: (context, snapshot) {
      return Center(
          child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Image.network(
              snapshot.data.image,
              height: 150,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Text(snapshot.data.username),
          Text(snapshot.data.email),
        ],
      ));
    },
  );
}
