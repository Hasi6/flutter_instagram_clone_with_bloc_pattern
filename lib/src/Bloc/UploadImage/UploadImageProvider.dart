import 'package:flutter/cupertino.dart';
import 'package:insta_clone/src/Bloc/UploadImage/UploadImageBloc.dart';

class UploadPostProvider extends InheritedWidget {
  final bloc = UploadPostBloc();

  UploadPostProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static UploadPostBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(UploadPostProvider)
            as UploadPostProvider)
        .bloc;
  }
}
