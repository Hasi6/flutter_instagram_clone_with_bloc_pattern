import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/src/Bloc/Feed/FeedProvider.dart';
import 'package:insta_clone/src/models/Posts.dart';
import 'package:insta_clone/src/models/User.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class FeedBody extends StatelessWidget {
  const FeedBody({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // @override
    // void dispose() {
    //   _scrollController.dispose();
    //   super.dispose();
    // }

    final bloc = FeedProvider.of(context);
    ScrollController _scrollController = new ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        bloc.getFeeds(2);
      }
    });
    return Container(
      child: StreamBuilder(
        stream: bloc.posts,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  controller: _scrollController,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Post postModel = Post.fromJson(snapshot.data[index]);
                    User userModel =
                        User.fromJson(snapshot.data[index]['user']);

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(userModel.image))),
                              ),
                              Text(userModel.username,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              IconButton(
                                icon: Icon(Icons.more_vert),
                                onPressed: null,
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child:
                              Image.network(postModel.image, fit: BoxFit.cover),
                        )
                      ],
                    );
                  },
                )
              : Container(
                  color: Colors.lightBlue,
                  child: Center(
                    child: Loading(
                        indicator: BallPulseIndicator(),
                        size: 100.0,
                        color: Colors.pink),
                  ),
                );
        },
      ),
    );
  }
}
