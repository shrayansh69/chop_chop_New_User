import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const hello());
}

class hello extends StatelessWidget {
  const hello({Key? key});
  Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle denied permission
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    checkLocationPermission();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  LatLng? sourceLocation; // Define sourceLocation variable

  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // Get current location when the widget initializes
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        sourceLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  Set<Marker> _buildMarkers() {
    // Implement the function to build markers on the map
    // You can create markers using the sourceLocation or any other location data
    return <Marker>{};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (sourceLocation != null)
              Container(
                height: MediaQuery.of(context).size.height * 1,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: sourceLocation!,
                    zoom: 15,
                  ),
                  markers: _buildMarkers(),
                  buildingsEnabled: false,
                  zoomControlsEnabled: false,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
