import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

Widget uploadScreen(BuildContext context) {
  return Scaffold(
    body: Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 42.0,
      child: TextField(
        onTap: () async {
          Prediction p = await PlacesAutocomplete.show(
              context: context,
              apiKey: "AIzaSyDfc3fsuRVv0wrp3FfPqrtdbtsY5YQQl2k",
              mode: Mode.overlay, // Mode.fullscreen
              language: "fr",
              components: [new Component(Component.country, "lk")]);
          print(p.placeId.toString());
        },
        decoration: InputDecoration(
            hintText: "Places",
            hintStyle: TextStyle(fontSize: 16, color: Colors.black),
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            fillColor: Colors.grey,
            filled: true),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.arrow_upward),
      tooltip: "Hasi",
      onPressed: () {},
    ),
  );
}
