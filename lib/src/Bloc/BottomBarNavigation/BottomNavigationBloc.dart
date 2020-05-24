import 'dart:async';
import 'package:rxdart/rxdart.dart';

class BottomNavigationBloc {
  final _index = BehaviorSubject<int>();

  BottomNavigationBloc() {
    changeIndex(0);
  }

  // ADD DATA TO STREAMS
  Stream<int> get numbers => _index;

  // CHANGE DATA
  Function(int) get changeIndex => _index.sink.add;

  dispose() {
    _index.close();
  }
}
