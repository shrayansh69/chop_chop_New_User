import 'package:cl/Screens/Drawers/Send_Package/Daddress.dart';
import 'package:cl/Screens/Drawers/Send_Package/SendPackage.dart';
import 'package:cl/Screens/suggestion/components/location_list_tile.dart';
import 'package:cl/Screens/suggestion/components/network_utility.dart';
import 'package:cl/Screens/suggestion/models/autocomplate_prediction.dart';
import 'package:cl/Screens/suggestion/models/place_auto_complate_response.dart';
import 'package:cl/test2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';

import 'constants.dart';

class SearchLocationScreen2 extends StatefulWidget {
  const SearchLocationScreen2({Key? key}) : super(key: key);

  @override
  State<SearchLocationScreen2> createState() => _SearchLocationScreen2State();
}

class _SearchLocationScreen2State extends State<SearchLocationScreen2> {
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
          "Select Delivery Address",
          style: TextStyle(color: textColorLightTheme),
        ),
      ),
      body: Column(
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
                MaterialPageRoute(builder: (context) => const Test2()),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Color(0xFFFFC700),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
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
                saddress = placePredictions[index].description!;

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DAddress()),
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
