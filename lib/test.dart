import 'dart:async';

import 'package:cl/Screens/Drawers/Send_Package/SendPackage.dart';
import 'package:cl/Screens/Drawers/Send_Package/address.dart';
import 'package:cl/Screens/suggestion/components/location_list_tile.dart';
import 'package:cl/Screens/suggestion/components/network_utility.dart';
import 'package:cl/Screens/suggestion/constants.dart';
import 'package:cl/Screens/suggestion/location_search_screen.dart';
import 'package:cl/Screens/suggestion/models/autocomplate_prediction.dart';
import 'package:cl/Screens/suggestion/models/place_auto_complate_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Test(),
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List<AutocompletePrediction> placePredictions = [];

  void PlaceAutocomplate(String query) async {
    Uri uri =
        Uri.https("maps.googleapis.com", 'maps/api/place/autocomplete/json', {
      "input": query,
      "key": apiKey,
    });
    String? response = await NetworkUtility.fetchUrl(uri);
    print(response);
    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }
  }

  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  String address = '';
  LatLng _center = const LatLng(30.3165, 78.0322);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: const Text('Select Delivery Location'),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 15,
                  ),
                  onCameraMove: _onCameraMove,
                  markers: {
                    Marker(
                      markerId: MarkerId('center'),
                      position: _center,
                      draggable: true, // Marker can be dragged
                    ),
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          pDaddress == '' ? 'Dehradun, India' : pDaddress,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
              height: 312,
              child: Column(
                children: [
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: TextFormField(
                        onChanged: (value) {
                          PlaceAutocomplate(value);
                        },
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          hintText: "Search your location",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: SvgPicture.asset(
                              "assets/icons/location_pin.svg",
                              color: secondaryColor40LightTheme,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: placePredictions.length,
                    itemBuilder: (context, index) => LocationListTile(
                      press: () {
                        setState(() {
                          paddress = placePredictions[index].description!;
                        });

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const SAddress()),
                        // );
                      },
                      location: placePredictions[index].description!,
                    ),
                  )),
                ],
              ))
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    mapController = controller;
  }

  void _onCameraMove(CameraPosition position) async {
    final coordinates = position.target;
    final addresses = await geocoding.placemarkFromCoordinates(
      coordinates.latitude,
      coordinates.longitude,
    );
    setState(() {
      // address = addresses.first.name ?? '';
      _center = coordinates;
    });
  }
}
