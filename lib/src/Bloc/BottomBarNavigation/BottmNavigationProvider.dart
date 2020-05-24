import 'package:flutter/cupertino.dart';
import 'package:insta_clone/src/Bloc/BottomBarNavigation/BottomNavigationBloc.dart';

class Provider extends InheritedWidget {
  final bloc = BottomNavigationBloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static BottomNavigationBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}
