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
    if (_posts.value == null) {
      getFeeds(1);
    }
  }

  getFeeds(page) async {
    Timer(Duration(seconds: 4), () async {
      try {
        var response = await http.get("${config.endPoint}/api/getPosts/$page");
        var postModel = jsonDecode(response.body.toString());
        var newPosts;
        if (_posts.value != null) {
          newPosts = _posts.value + postModel;
        } else {
          newPosts = postModel;
        }
        changePosts(newPosts);
      } catch (e) {
        print(e);
      }
    });
  }

  dispose() {
    _posts.close();
  }
}
