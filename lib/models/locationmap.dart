import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMap extends StatefulWidget {
  @override
  _LocationMapState createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(26.8206, 30.8025)),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
              Icons.arrow_back,
              color: Colors.black,
                    size: 30,

            ),
                ),
          ),
        ],
      ),
    );
  }
}