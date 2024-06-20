import 'package:cl/Screens/Drawers/Send_Package/OrderSummary.dart';
import 'package:cl/Screens/HomeScreen.dart';
import 'package:cl/Screens/SplashScreen.dart';
import 'package:cl/test.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle denied permission
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Handle permanently denied permission
    }
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
