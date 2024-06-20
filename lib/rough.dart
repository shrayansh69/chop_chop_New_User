import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class rough extends StatefulWidget {
  const rough({Key? key}) : super(key: key);

  @override
  State<rough> createState() => _roughState();
}

class _roughState extends State<rough> {
  late GoogleMapController mapController;
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (currentLocation != null)
          ? GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentLocation!,
                zoom: 15,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
