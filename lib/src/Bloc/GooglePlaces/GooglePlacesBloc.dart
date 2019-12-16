import 'dart:async';
import 'package:rxdart/rxdart.dart';

class GooglePlacesBloc {
  final _palce = BehaviorSubject<String>();

  GooglePlacesBloc() {
    changePlace("Place");
  }

  // ADD DATA TO STREAMS
  Stream<String> get place => _palce;

  // CHANGE DATA
  Function(String) get changePlace => _palce.sink.add;

  dispose() {
    _palce.close();
  }
}
