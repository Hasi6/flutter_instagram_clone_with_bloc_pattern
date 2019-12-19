import 'package:flutter/cupertino.dart';
import 'package:insta_clone/src/Bloc/Register/RegisterBloc.dart';

class RegisterProvider extends InheritedWidget {
  final bloc = RegisterBloc();

  RegisterProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static RegisterBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(RegisterProvider)
            as RegisterProvider)
        .bloc;
  }
}
