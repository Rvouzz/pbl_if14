import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String destinationName;

  const Maps({
    required this.latitude,
    required this.longitude,
    required this.destinationName,
    Key? key,
  }) : super(key: key);

  @override
  State<Maps> createState() => _MapsState(latitude, longitude, destinationName);
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapController;
  final LatLng _center;
  final Marker _marker;

  _MapsState(double latitude, double longitude, String destinationName)
      : _center = LatLng(latitude, longitude),
        _marker = Marker(
          markerId: const MarkerId('1'),
          position: LatLng(latitude, longitude),
          infoWindow: InfoWindow(
            title: destinationName,
          ),
        );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 17.0,
        ),
        markers: {_marker},
      ),
    );
  }
}
