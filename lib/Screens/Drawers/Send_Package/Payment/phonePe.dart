import 'dart:async';
import 'dart:convert';

import 'package:cl/Constants/Dropdown.dart';
import 'package:cl/Constants/location.dart';
import 'package:cl/Screens/Drawers/Order_History/Success_.dart';
import 'package:cl/Screens/Drawers/Send_Package/OrderPlaced.dart';
import 'package:cl/Screens/Drawers/Send_Package/OrderSummary.dart';
import 'package:cl/Screens/Drawers/Send_Package/Payment/failed.dart';
import 'package:cl/Screens/Drawers/Send_Package/Payment/sucess.dart';
import 'package:cl/Screens/Drawers/Send_Package/SendPackage.dart';
import 'package:cl/Screens/HomeScreen.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class phonePe extends StatefulWidget {
  const phonePe({super.key});
  @override
  State<phonePe> createState() => _phonePeState();
}

bool pay = false;
late Timer timer;
String urli = "";

class _phonePeState extends State<phonePe> {
  late BuildContext myContext;
  late WebViewController controllerr;
  final controller = WebViewController()
    ..goForward()
    ..setNavigationDelegate(NavigationDelegate(
      onPageFinished: (url) {
        if (url ==
            // 'https://chopchoplogistic.com/Payment/phonepe-response/ChopChopLogistic$GlobalID'
            'https://chopchoplogistic.com/Payment/phonepe/retu') {
          print("dsvsv");
          pay = true;
          urli = url;
        }

        // Navigate to another page when the WebView finishes loading
      },
      onNavigationRequest: (NavigationRequest request) {
        // Handle navigation requests here
        print("Navigation request: ${request.url}");
        // You can return NavigationDecision to allow or cancel the navigation
        return NavigationDecision.navigate;
      },
    ))
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(GlobalResponse));

  void initState() {
    super.initState();

    // Start a repeating timer to check the value every 3 seconds
    timer = Timer.periodic(Duration(milliseconds: 100), (Timer t) {
      if (urli == "https://chopchoplogistic.com/Payment/phonepe/retu") {
        checkPayValue();
        executeApiCall();
        timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer.cancel();
    super.dispose();
  }

  // Method to check the value of pay and update the UI
  void checkPayValue() {
    if (mounted) {
      setState(() {
        // Update the value of pay and trigger a rebuild
        // You may replace this with your actual logic to determine the pay value
        pay = pay;
      });
    }
  }

  String UU = storedUID;
  void executeWalletUpdate() {
    String apiUrl =
        'https://chopchoplogistic.com/updateWallet/api/add/$UU,$GlobalAmount';
    http.get(Uri.parse(apiUrl)).then((response) {
      // Handle the response here
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['status'] == true) {
          print('navigate');
        } else {}
      }
    }).catchError((error) {
      // Handle errors here
      print('Error: $error');
    });
  }

  void executeApiCall() {
    // Your code to execute the API call
    String apiUrl =
        'https://chopchoplogistic.com/Payment/phonepe-response/ChopChopLogistic$GlobalID';

    http.get(Uri.parse(apiUrl)).then((response) {
      // Handle the response here
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData['status'] == true) {
          print('navigate');
          // executeWalletUpdate();
          postData1();
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => Success_()));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (_) => failed()));
        }
      }
    }).catchError((error) {
      // Handle errors here
      print('Error: $error');
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        centerTitle: true,
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Image.asset(
            "assets/logo.png",
            width: 80,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
          ),
          Container(
            height: double.infinity,
            color: Colors.white,
            child: WebViewWidget(
              controller: controller,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                pay == true
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.85,
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 0,
                                ),
                                Text(
                                  "Payment Processing",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                                Image.asset("assets/loader1.gif"),
                              ],
                            ),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   children: [
                            //     SizedBox(
                            //       width: mq.width * 1,
                            //       child: TextButton(
                            //         onPressed: () {
                            //           Navigator.push(
                            //               context,
                            //               MaterialPageRoute(
                            //                   builder: (_) => Alogin()));
                            //         },
                            //         child: Container(
                            //           height: mq.height * 0.060,
                            //           width: mq.width * 0.8,
                            //           decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(7),
                            //               border: Border.all(
                            //                   color: const Color.fromARGB(
                            //                       255, 185, 05, 05))),
                            //           child: const Column(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.center,
                            //             children: [
                            //               Text(
                            //                 "Return Home",
                            //                 style: TextStyle(
                            //                     fontSize: 18,
                            //                     color: Color.fromARGB(
                            //                         255, 185, 05, 05)),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      )
                    // ? loginScreen()
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
