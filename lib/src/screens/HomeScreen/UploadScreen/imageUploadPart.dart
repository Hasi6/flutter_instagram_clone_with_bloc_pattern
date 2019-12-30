import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/src/Bloc/UploadImage/UploadImageProvider.dart';

Widget imageUpload(BuildContext context) {
  final bloc = UploadPostProvider.of(context);

  Future getImageByCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    bloc.changeImage(image);
  }

  Future getImageByGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    bloc.changeImage(image);
  }

  Widget buttonCamera() {
    return StreamBuilder(
      stream: bloc.image,
      builder: (context, snapshot) {
        return snapshot.data != null
            ? Text("")
            : RaisedButton(
                child: Text("Capture Image"),
                onPressed: getImageByCamera,
              );
      },
    );
  }

  Widget uploadButton() {
    return StreamBuilder(
      stream: bloc.image,
      builder: (context, snapshot) {
        return snapshot.data != null
            ? RaisedButton(
                child: Text("Upload Image"),
                onPressed: bloc.uploadImage,
              )
            : Text("");
      },
    );
  }

  Widget buttonGallery() {
    return StreamBuilder(
      stream: bloc.image,
      builder: (context, snapshot) {
        return snapshot.data != null
            ? Text("")
            : RaisedButton(
                child: Text("Select Image"),
                onPressed: getImageByGallery,
              );
      },
    );
  }

  return Center(
    child: Column(
      children: <Widget>[
        StreamBuilder(
          stream: bloc.image,
          builder: (context, snapshot) {
            return snapshot.data != null
                ? Image.file(snapshot.data, width: 100.0)
                : Text('No image selected.');
          },
        ),
        buttonCamera(),
        buttonGallery(),
        uploadButton()
      ],
    ),
  );
}
