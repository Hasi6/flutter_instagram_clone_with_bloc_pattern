import 'package:flutter/cupertino.dart';
import 'package:insta_clone/src/Bloc/UserDetails/UserDetailesBloc.dart';

class UserProvider extends InheritedWidget {
  final bloc = UserBloc();

  UserProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static UserBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(UserProvider) as UserProvider)
        .bloc;
  }
}
