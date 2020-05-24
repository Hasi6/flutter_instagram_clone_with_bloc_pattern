import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:insta_clone/src/Bloc/GooglePlaces/GooglePlacesProvider.dart';
import 'package:insta_clone/src/Bloc/UserDetails/UserDetailsProvider.dart';
import 'package:insta_clone/src/models/Posts.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:http/http.dart' as http;
import 'package:insta_clone/src/config/config.dart' as config;

StorageReference storageReference =
    FirebaseStorage.instance.ref().child('images');

class UploadPostBloc {
  final _image = BehaviorSubject<File>();

  // ADD DATA TO STREAMS
  Stream<File> get image => _image.stream;

  // CHANGE DATA
  Function(File) get changeImage => _image.sink.add;

  uploadImage(BuildContext context) async {
    StorageUploadTask uploadTask = storageReference.putFile(_image.value);
    await uploadTask.onComplete;

    var placeBloc = GooglePlacesProvider.of(context);
    var userBloc = UserProvider.of(context);
    var location = placeBloc.getPlace();

    var user = userBloc.sendUserData();
    print(user.id);

    storageReference.getDownloadURL().then((fileURL) async {
      var body = jsonEncode({
        'user': user.id,
        'caption': "caption",
        'location': location,
        'image': fileURL
      });

      http.Response response = await http.post("${config.endPoint}/api/addPost",
          body: body, headers: config.headers);
      Post postModel = Post.fromJson(jsonDecode(response.body));
      print(postModel.id);
    });
  }

  dispose() {
    _image.close();
  }
}
