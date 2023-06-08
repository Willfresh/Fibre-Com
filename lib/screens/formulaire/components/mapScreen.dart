import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  static String routeName= "/map";
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  late LocationData _currentLocation;
  Set<Marker> _markers = Set();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _getCurrentLocation() async {
    var location = Location();
    _currentLocation = await location.getLocation();
    if (_currentLocation != null) {
      _markers.add(Marker(
        markerId: MarkerId("currentLocation"),
        position: LatLng(_currentLocation.latitude!, _currentLocation.longitude!),
        infoWindow: InfoWindow(title: "Current Location"),
      ));
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(_currentLocation.latitude!, _currentLocation.longitude!),
        zoom: 15.0,
      )));
    }

  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sélectionner la localisation'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(0.0, 0.0),
          zoom: 2.0,
        ),
        markers: _markers,
        onTap: (position) {
          setState(() {
            _markers.clear();
            _markers.add(Marker(
              markerId: MarkerId("selectedLocation"),
              position: position,
              infoWindow: InfoWindow(title: "Selected Location"),
            ));
          });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context, _markers.first.position);
        },
        label: Text('Définir la localisation'),
        icon: Icon(Icons.location_on),
      ),
    );
  }
}

