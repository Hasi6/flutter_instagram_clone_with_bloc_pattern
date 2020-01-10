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
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              Post postModel = Post.fromJson(snapshot.data[index]);
              User userModel = User.fromJson(snapshot.data[index]['user']);

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
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
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
