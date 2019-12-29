import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class UploadPostBloc {
  final _image = BehaviorSubject<File>();

  // ADD DATA TO STREAMS
  Stream<File> get image => _image.stream;

  // CHANGE DATA
  Function(File) get changeImage => _image.sink.add;

  dispose() {
    _image.close();
  }
}
