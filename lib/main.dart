import 'package:device_preview/device_preview.dart';

import 'Screens/HomeScreen.dart';
import 'package:cl/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(MyApp());
  runApp(DevicePreview(
    builder: (context) {
      return MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {}
    }

    if (permission == LocationPermission.deniedForever) {}
  }

  final introdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    checkLocationPermission();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: (introdata.read("displayed") ?? false)
          ? const HomeScreen()
          : const SplashScreen(),
      // home: Test(),
    );
  }
}
