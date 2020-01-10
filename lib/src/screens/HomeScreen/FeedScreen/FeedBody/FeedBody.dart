import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:insta_clone/src/Bloc/Feed/FeedProvider.dart';
import 'package:insta_clone/src/models/Posts.dart';
import 'package:insta_clone/src/models/User.dart';

class FeedBody extends StatelessWidget {
  const FeedBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = FeedProvider.of(context);
    return Container(
      child: StreamBuilder(
        stream: bloc.posts,
        builder: (context, snapshot) {
          Post postModel = Post.fromJson(snapshot.data[0]);
          User userModel = User.fromJson(snapshot.data[0]['user']);
          return Column(
            children: <Widget>[
              Text(userModel.image.toString()),
              // Text(postModel.user.id.toString()),
            ],
          );
        },
      ),
    );
  }
}
