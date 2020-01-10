import 'dart:async';
import 'dart:convert';
import 'package:insta_clone/src/models/Posts.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:insta_clone/src/config/config.dart' as config;

class Posts {
  List posts = [Post];
}

class FeedBloc {
  final _posts = BehaviorSubject<List>();

  // ADD DATA TO STREAMS
  Stream<List> get posts => _posts;

  List getPosts() {
    return _posts.value;
  }

  // CHANGE DATA
  Function(List) get changePosts => _posts.sink.add;

  FeedBloc() {
    getFeeds();
  }

  getFeeds() async {
    try {
      var response = await http.get("${config.endPoint}/api/getPosts/1");
      var postModel = jsonDecode(response.body);
      changePosts(postModel[0]);
    } catch (e) {
      print(e.message);
    }
  }

  dispose() {
    _posts.close();
  }
}
