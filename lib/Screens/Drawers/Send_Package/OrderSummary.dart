import 'dart:convert';

import 'package:cl/Constants/Dropdown.dart';
import 'package:cl/Constants/location.dart';
import 'package:cl/Screens/Drawers/Send_Package/LoadingPage.dart';
import 'package:cl/Screens/Drawers/Send_Package/OrderPlaced.dart';
import 'package:cl/Screens/Drawers/Send_Package/Payment/phonePe.dart';
import 'package:cl/Screens/Drawers/Send_Package/SendPackage.dart';
import 'package:cl/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../OnBoardingScreens/OnBoardingScreen.dart';

bool loader = false;
String test = UID;
String formattedValue = x.toStringAsFixed(2);
int GlobalID = 0;
int GlobalAmount = 0;
int GlobalNumber = 0;
String GlobalResponse = '';

class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

String pfflat = "";
String sfflat = "";

class _OrderSummaryState extends State<OrderSummary> {
  Future<void> postData1() async {
    // Replace this URL with the actual API endpoint you want to POST data to.
    const String apiUrl = 'https://chopchoplogistic.com/sendPackage/api/send';

    // Replace this with the data you want to send in the request body.
    final Map<String, dynamic> data = {
      "UID": storedUID,
      "P_name": SP_P_name,
      "P_phone": SP_P_phone,
      "P_flat": pfflat,
      "P_area": paddress,
      "D_name": SP_D_name,
      "D_phone": SP_D_phone,
      "D_flat": sfflat,
      "D_area": saddress,
      "SYP": SP_SYP,
      "weight": dropdownValue,
      "category": SP_category,
      "payment": SP_payment,
      "distance": money,
      "P_latitude": lat,
      "P_longitude": lon,
      "Total_fare": x,
      "Drivers_earning": delivery_part_profir
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json', // Adjust the content type as needed
      },
    );

    if (response.statusCode == 200) {
      SP_P_name = "";
      print("Success: ${response.body}");

      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const OrderPlaced()));
    } else {
      print("Error: ${response.statusCode}");
      print("Response: ${response.body}");
    }
  }

  Future<void> makePostRequest() async {
    final url =
        Uri.parse('https://chopchoplogistic.com/Counter/api/increment-count');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        // get count variable
        print('true');
        makeGetRequest();
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> makeGetRequest() async {
    final url = Uri.parse('https://chopchoplogistic.com/Counter/api/get-count');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        int countValue = jsonResponse['count'];
        print(countValue);
        GlobalID = countValue;
        makeGetRequest2();
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> makeGetRequest2() async {
    var url = Uri.parse(
        'https://chopchoplogistic.com/Payment/phonepe/$SP_P_phone/$GlobalAmount/$GlobalID');

    try {
      // Make the GET request
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          // Add any other headers as needed
        },
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Handle the response as needed
        GlobalResponse = response.body;
        print(GlobalResponse);
        Navigator.push(context, MaterialPageRoute(builder: (_) => phonePe()));
      } else {
        // Request failed with a non-200 status code
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (error) {
      // Handle any errors that occurred during the request
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(SP_SYP);
    int roundedX = x.round();
    x = roundedX.toDouble();
    print(x);
    pfflat = pflat + ", " + pbuild;
    sfflat = sflat + ", " + sbuild;
    print("hel : " + pfflat);
    print(paddress);
    print("hel : " + sfflat);
    print(saddress);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Summary",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Color(0xFF008000)),
        ),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        top: MediaQuery.of(context).size.height * 0.02),
                    width: MediaQuery.of(context).size.width *
                        0.9, // Set the desired width
                    height: MediaQuery.of(context).size.height *
                        0.3, // Set the desired height
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
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Shipping From:",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'Name : $SP_P_name',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Mobile Number : $SP_P_phone',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Address : ' +
                              pflat +
                              (pflat == '' ? '' : ',') +
                              pbuild +
                              (pbuild == '' ? '' : ' ,\n') +
                              paddress,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.02),
                  width: MediaQuery.of(context).size.width *
                      0.9, // Set the desired width
                  height: MediaQuery.of(context).size.height *
                      0.3, // Set the desired height
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
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Shipping To:",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Name : $SP_D_name',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        'Mobile Number : $SP_D_phone',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        'Address : ' +
                            sflat +
                            (sflat == '' ? '' : ',') +
                            sbuild +
                            (sbuild == '' ? '' : ',\n') +
                            saddress,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Text(
                            'Weight : $dropdownValue',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            'Category : $SP_category',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          // Text(
                          //   'Total Distance : $money KM',
                          //   style: const TextStyle(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.w600,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height * 0.01,
                          // ),
                          Text(
                            'Payment Type : $SP_payment',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          // const Text(
                          //   'Payment : ',
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.w600,
                          //   ),
                          // ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                            ),
                            width: MediaQuery.of(context).size.width *
                                0.9, // Set the desired width
                            height: MediaQuery.of(context).size.height *
                                0.08, // Set the desired height
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  10), // Set the desired border radius
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.3), // Set the shadow color
                                  spreadRadius:
                                      2, // Set how far the shadow spreads
                                  blurRadius: 11, // Set the amount of blur
                                  offset: const Offset(0, 4), // Set the offset
                                ),
                              ],
                              color: Colors.white, // Set the background color
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  "Total Fare :",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Text(
                                  "₹ $roundedX/-",
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xFFFFC700),
                      elevation: 0, // Text color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                    onPressed: () {
                      GlobalAmount = roundedX;
                      if (SP_payment == 'Cash') {
                        postData1();
                      } else if (SP_payment == 'Online') makePostRequest();

                      // postData1();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoadingPage()),
                      );
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Place Order',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ],
            ),
          )),
    );
  }
}
