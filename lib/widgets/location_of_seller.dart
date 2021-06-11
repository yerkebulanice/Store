import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:latlong/latlong.dart';
import 'dart:async';

// ignore: must_be_immutable
class LocationOfSeller extends StatelessWidget {
  final double longitude;
  final double latitude;
  final String address;
  LocationOfSeller({this.longitude, this.latitude, this.address});

  GoogleMapController mapController;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(
      50.2963468,
      57.1715153,
    ),
    zoom: 16,
  );

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _createMarker() {
    return {
      Marker(
        markerId: MarkerId("Marker_1"),
        position: LatLng(longitude, latitude),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          address,
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.left,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close_outlined,
            size: 40,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Color(0xFFE98E34),
                Color(0xFFD3452F),
              ],
            ),
          ),
        ),
      ),
      body: GoogleMap(
        zoomControlsEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: LocationOfSeller._kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _createMarker(),
      ),
    );
  }
}
