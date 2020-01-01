import 'package:flutter/cupertino.dart';
import 'package:insta_clone/src/Bloc/Feed/FeedBloc.dart';

class FeedProvider extends InheritedWidget {
  final bloc = FeedBloc();

  FeedProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static FeedBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(FeedProvider) as FeedProvider)
        .bloc;
  }
}
