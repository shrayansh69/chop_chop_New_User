import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cl/Screens/Drawers/Send_Package/SendPackage.dart';
import 'package:cl/Screens/HomeScreen.dart';
import 'package:cl/Screens/suggestion/location_search_screen.dart';
import 'package:cl/hello.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

String SelectedAddress3 = '';

class SAddress extends StatefulWidget {
  const SAddress({super.key});

  @override
  State<SAddress> createState() => _SAddressState();
}

class _SAddressState extends State<SAddress> {
  bool isChecked = false;
  bool isChecked95 = false;
  Position? currentPosition;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
  }

  String SelectedAddress = '';
  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        currentPosition = position;
        print('current');
      });
      _getAddressFromLatLng(position.latitude, position.longitude);
    } catch (e) {
      print("Error getting current location: $e");
      // Handle error getting current location
    }
  }

  Future<void> _getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        print(placemark);
        // Update the UI with locality, city, and state
        setState(() {
          SelectedAddress =
              '${placemark.thoroughfare!}, ${placemark.subLocality!}, ${placemark.locality!}, ${placemark.administrativeArea!}, ${placemark.postalCode!}';
          print(SelectedAddress);
          // You can update other variables or UI elements here with placemark information
        });
      }
    } catch (e) {
      print("Error getting address from coordinates: $e");
      // Handle error getting address
    }
  }

  String? selectedValue;

// Sending Package Variables

// End of Sending Package Variables
//Text Controllers ---->>>>
  TextEditingController nameControllerr1 = TextEditingController();
  TextEditingController nameControllerr2 = TextEditingController();
  TextEditingController nameControllerr3 = TextEditingController();
  TextEditingController nameControllerr4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    sourcePage = 'Test1';
    print('location : ' + SelectedAddress);
    String trimmedAddress =
        (paddress.length <= 30) ? paddress : paddress.substring(0, 27) + '...';

    SelectedAddress3 = SelectedAddress;

    // SelectedAddress = SelectedAddress.length <= 30
    //     ? SelectedAddress
    //     : SelectedAddress.substring(0, 27) + '...';

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.02),
                  width: MediaQuery.of(context).size.width *
                      0.9, // Set the desired width
                  height: MediaQuery.of(context).size.height *
                      0.43, // Set the desired height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10), // Set the desired border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.3), // Set the shadow color
                        spreadRadius: 2, // Set how far the shadow spreads
                        blurRadius: 11, // Set the amount of blur
                        offset: const Offset(0, 4), // Set the offset
                      ),
                    ],
                    color: Colors.white, // Set the background color
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AutoSizeText(
                        'Pickup Address',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        minFontSize: 15,
                        maxFontSize: 18,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.03,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: ElevatedButton(
                          onPressed: isChecked == true
                              ? () {}
                              : () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SearchLocationScreen()),
                                  );
                                },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(left: 0),
                              backgroundColor: Colors.white,
                              shadowColor: Colors.white,
                              foregroundColor: Colors.white,
                              surfaceTintColor: Colors.white,
                              side: BorderSide(
                                  color: Color(0xFFFFC700), width: 2.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)))),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  isChecked == true
                                      ? SelectedAddress.length <= 30
                                          ? SelectedAddress
                                          : SelectedAddress.substring(0, 27) +
                                              '...'
                                      : (paddress == "")
                                          ? 'Select Address'
                                          : trimmedAddress,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 98, 98),
                                    // Add other text styles as needed
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 20.0, // Set the desired width
                            height: 20.0, // Set the desired height
                            decoration: BoxDecoration(
                              shape: BoxShape
                                  .rectangle, // Use BoxShape.circle for a circular checkbox
                              borderRadius: BorderRadius.circular(
                                  4.0), // Set the desired border radius
                              border: Border.all(
                                color: const Color.fromARGB(
                                    255, 124, 124, 124), // Set the border color
                                width: 0.05, // Set the border width
                              ),
                              color: isChecked
                                  ? const Color(0xFFFFC700)
                                  : Colors
                                      .transparent, // Set the checkbox fill color
                            ),
                            child: Checkbox(
                              value: isChecked,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  isChecked = newValue!;
                                });
                              },
                              activeColor: const Color(
                                  0xFFFFC700), // Set the color of the checkmark
                              checkColor: Colors
                                  .white, // Set the color of the checkmark itself
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.1,
                          ),
                          const Text(
                            "Pick my current location",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.23,
                            // height: MediaQuery.of(context).size.height * 0.05,
                            child: TextFormField(
                              controller: nameControllerr1,
                              onChanged: (value) {
                                pflat = value;
                              },
                              decoration: InputDecoration(
                                hintText: (pflat == "") ? 'Flat No.' : pflat,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFFC700), width: 2.0),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFFC700), width: 2.0),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.52,
                            // height: MediaQuery.of(context).size.height * 0.05,
                            child: TextFormField(
                              controller: nameControllerr2,
                              onChanged: (value) {
                                pbuild = value;
                              },
                              decoration: InputDecoration(
                                hintText: (pbuild == "")
                                    ? 'Building Name (Optional)'
                                    : pbuild,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFFC700), width: 2.0),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFFC700), width: 2.0),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          controller: nameControllerr3,
                          onChanged: (value) {
                            phr = value;
                            // double spSypDouble = double.parse(value);
                            // parcel_sec_charge = spSypDouble * 0.05;
                          },
                          decoration: InputDecoration(
                            hintText:
                                (phr == "") ? 'How to reach (Optional)' : phr,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFFFFC700), width: 2.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFFFFC700), width: 2.0),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color(0xFFFFC700),
                    elevation: 0, // Text color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  onPressed: () async {
                    print("hello:" + SelectedAddress3);
                    // ignore: use_build_context_synchronously
                    print(trimmedAddress);
                    print(paddress);
                    if (isChecked == true) {
                      paddress = SelectedAddress3;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Send_Package()),
                    );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Proceed',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FutureBuilder(
                future: Future.delayed(const Duration(
                    seconds:
                        1)), // Replace with your actual data loading function
                builder: (context, snapshot) {
                  if (isLoading) {
                    isLoading = false;
                    print("Loaded");
                    return Center(
                        child: Image.asset(
                      "assets/loader.gif",
                      width: 150,
                      height: 150,
                    ));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double totalFareCalculate = 0;

double calculate_fare(double distanceTravelInKm) {
  double temp = 0;
  double fareKm = 0;
  if (distanceTravelInKm <= 4) {
    temp = 60;
  } else if (distanceTravelInKm > 4 && distanceTravelInKm <= 12) {
    fareKm = 15;
  } else if (distanceTravelInKm > 11 && distanceTravelInKm <= 15) {
    fareKm = 14;
  } else if (distanceTravelInKm > 15 && distanceTravelInKm <= 20) {
    fareKm = 13;
  } else if (distanceTravelInKm > 20 && distanceTravelInKm <= 25) {
    fareKm = 12;
  } else if (distanceTravelInKm > 25 && distanceTravelInKm <= 30) {
    fareKm = 11;
  } else if (distanceTravelInKm > 30 && distanceTravelInKm <= 35) {
    fareKm = 10;
  } else if (distanceTravelInKm > 35 && distanceTravelInKm <= 50) {
    fareKm = 8;
  } else if (distanceTravelInKm > 50 && distanceTravelInKm <= 70) {
    fareKm = 7;
  } else if (distanceTravelInKm > 70 && distanceTravelInKm <= 80) {
    fareKm = 6.5;
  } else if (distanceTravelInKm > 80 && distanceTravelInKm <= 100) {
    fareKm = 6;
  }

  if (temp == 60) {
    totalFareCalculate = 60 + (double.parse(SP_SYP) * 0.05);
    delivery_part_profir = 42;
    return totalFareCalculate.toDouble();
  } else {
    totalFareCalculate = fareKm * distanceTravelInKm;
    delivery_part_profir = (totalFareCalculate * 70 / 100);
    if (double.parse(SP_SYP) == 0) {
      totalFareCalculate = totalFareCalculate;
    } else {
      totalFareCalculate += (double.parse(SP_SYP) * 0.05);
    }
    return totalFareCalculate.toDouble();
  }
}
