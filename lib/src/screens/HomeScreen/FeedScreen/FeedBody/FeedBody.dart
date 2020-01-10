import 'package:flutter/cupertino.dart';
import 'package:insta_clone/src/Bloc/Feed/FeedProvider.dart';

class FeedBody extends StatelessWidget {
  const FeedBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = FeedProvider.of(context);
    return Container(
      child: StreamBuilder(
        stream: bloc.posts,
        builder: (context, snapshot) {
          return Text("Hasi");
        },
      ),
    );
  }
}
