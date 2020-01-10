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
  final _posts = BehaviorSubject<Posts>();

  // ADD DATA TO STREAMS
  Stream<Posts> get posts => _posts;

  Posts getPosts() {
    return _posts.value;
  }

  // CHANGE DATA
  Function(Posts) get changePosts => _posts.sink.add;

  FeedBloc() {
    getFeeds();
  }

  getFeeds() async {
    try {
      var response = await http.get("${config.endPoint}/api/getPosts/1");
      var postModel = Post.fromJson(jsonDecode(response.body));
      print(postModel.toString());
      print("postModel");
    } catch (e) {
      print(e.message);
    }
  }

  dispose() {
    _posts.close();
  }
}
