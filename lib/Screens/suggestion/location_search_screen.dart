import 'package:cl/Screens/Drawers/Send_Package/SendPackage.dart';
import 'package:cl/Screens/Drawers/Send_Package/address.dart';
import 'package:cl/Screens/suggestion/components/location_list_tile.dart';
import 'package:cl/Screens/suggestion/components/network_utility.dart';
import 'package:cl/Screens/suggestion/models/autocomplate_prediction.dart';
import 'package:cl/Screens/suggestion/models/place_auto_complate_response.dart';
import 'package:cl/rough.dart';
import 'package:cl/test1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

import 'constants.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({Key? key}) : super(key: key);

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  bool isChecked = false;
  Position? currentPosition;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: defaultPadding),
        //   child: Padding(
        //       padding: const EdgeInsets.only(left: 6, right: 6),
        //       child: Icon(Icons.arrow_back)),
        // ),
        title: const Text(
          "Select Pickup Address",
          style: TextStyle(color: textColorLightTheme),
        ),
      ),
      body: Column(
        children: [
          // Test1(),
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
          Text(
            'OR',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Test1()),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Color(0xFFFFC700),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                'Select on map',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: placePredictions.length,
            itemBuilder: (context, index) => LocationListTile(
              press: () {
                paddress = placePredictions[index].description!;
                print(paddress);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SAddress()),
                );
              },
              location: placePredictions[index].description!,
            ),
          )),
        ],
      ),
    );
  }
}
