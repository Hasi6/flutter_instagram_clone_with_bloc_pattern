import 'dart:async';
import 'package:insta_clone/src/models/Posts.dart';
import 'package:rxdart/rxdart.dart';

class Posts {
  List posts = [Post];
}

class FeedBloc {
  final _posts = BehaviorSubject<Posts>();

  // ADD DATA TO STREAMS
  Stream<Posts> get place => _posts;

  Posts getPlace() {
    return _posts.value;
  }

  // CHANGE DATA
  Function(Posts) get changePlace => _posts.sink.add;

  dispose() {
    _posts.close();
  }
}
