import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:insta_clone/src/Bloc/GooglePlaces/GooglePlacesBloc.dart';
import 'package:insta_clone/src/Bloc/GooglePlaces/GooglePlacesProvider.dart';
import 'package:insta_clone/src/Bloc/UploadImage/UploadImageProvider.dart';
import 'package:insta_clone/src/screens/HomeScreen/UploadScreen/imageUploadPart.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = GooglePlacesProvider.of(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 10.0),
              height: 42.0,
              child: placesApi(bloc)),
          imageUpload(context)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        tooltip: "Hasi",
        onPressed: () {},
      ),
    );
  }

  Widget placesApi(GooglePlacesBloc bloc) {
    return StreamBuilder(
      stream: bloc.place,
      builder: (context, snapshot) {
        return TextFormField(
          onTap: () async {
            Prediction p = await PlacesAutocomplete.show(
                context: context,
                apiKey: "AIzaSyDfc3fsuRVv0wrp3FfPqrtdbtsY5YQQl2k",
                mode: Mode.overlay, // Mode.fullscreen
                language: "fr",
                components: [new Component(Component.country, "lk")]);
            if (p != null) {
              bloc.changePlace(p.description);
            }
          },
          decoration: InputDecoration(
              hintText: snapshot.data.toString(),
              hintStyle: TextStyle(fontSize: 16, color: Colors.black),
              prefixIcon: Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              fillColor: Colors.grey,
              filled: true),
        );
      },
    );
  }
}
