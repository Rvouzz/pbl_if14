import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(1.1222270656978806, 104.11827319985684);
  final Marker _marker = const Marker(
    markerId: MarkerId('1'),
    position: LatLng(1.1222270656978806, 104.11827319985684),
    infoWindow: InfoWindow(
      title: 'Marker Title',
      snippet: 'Marker Description',
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