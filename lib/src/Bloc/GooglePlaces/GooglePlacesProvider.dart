import 'package:flutter/cupertino.dart';
import 'package:insta_clone/src/Bloc/GooglePlaces/GooglePlacesBloc.dart';

class GooglePlacesProvider extends InheritedWidget {
  final bloc = GooglePlacesBloc();

  GooglePlacesProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static GooglePlacesBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(GooglePlacesProvider)
            as GooglePlacesProvider)
        .bloc;
  }
}
