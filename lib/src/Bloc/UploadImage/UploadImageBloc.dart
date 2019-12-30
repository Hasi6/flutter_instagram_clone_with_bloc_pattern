import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

StorageReference storageReference =
    FirebaseStorage.instance.ref().child('images');

class UploadPostBloc {
  final _image = BehaviorSubject<File>();

  // ADD DATA TO STREAMS
  Stream<File> get image => _image.stream;

  // CHANGE DATA
  Function(File) get changeImage => _image.sink.add;

  uploadImage() async {
    StorageUploadTask uploadTask = storageReference.putFile(_image.value);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      print(fileURL);
    });
  }

  dispose() {
    _image.close();
  }
}
