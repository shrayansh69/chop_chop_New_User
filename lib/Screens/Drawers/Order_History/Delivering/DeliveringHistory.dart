import 'dart:convert';

import 'package:cl/Screens/Drawers/Order_History/Delivering/Delivering_.dart';
import 'package:cl/Screens/Drawers/Order_History/MainOrderHistory.dart';
import 'package:cl/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<Map<String, dynamic>> data1 = [];

class DeliveringHistory extends StatefulWidget {
  const DeliveringHistory({super.key});

  @override
  State<DeliveringHistory> createState() => _DeliveringHistoryState();
}

class _DeliveringHistoryState extends State<DeliveringHistory> {
  @override
  void initState() {
    super.initState();
    fetchDataFromAPI1();
  }

  Future<void> fetchDataFromAPI1() async {
    try {
      final response = await http.get(Uri.parse(
          'https://chopchoplogistic.com/DriverOrderList/api/list3/$storedUID'));
      print(storedUID);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData is List) {
          if (mounted) {
            setState(() {
              data1 = List<Map<String, dynamic>>.from(jsonData);
              data1.sort((a, b) => b['Timestamp'].compareTo(a['Timestamp']));
            });
          }
        } else {
          throw Exception('API response is not a list.');
        }
      } else {
        throw Exception(
            'API request failed with status ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Order_History()),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            data1.where((item) => item['status'] == 'A').isEmpty
                ? Column(
                    children: [
                      Center(
                        child: Image.asset("assets/z4c7jIndmE.gif"),
                      ),
                      const Text(
                        "No Data Found",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        data1.where((item) => item['status'] == 'A').length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = data1
                          .where((item) => item['status'] == 'A')
                          .toList()[index];
                      OrderID = "${item['id']}${item['UID']}";

                      return GestureDetector(
                        onTap: () {
                          if (item['status'] == 'A') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Delivering_(
                                        orderId: "${item['order_ID']}",
                                        Sender_name: "${item['S_name']}",
                                        Sender_phonenumber:
                                            "${item['S_phone']}",
                                        Sender_address: "${item['S_address']}",
                                        Parcelvalue: "${item['SYP']}",
                                        Parcelweight: "${item['weight']}",
                                        Parcelcateg: "${item['category']}",
                                        Receiver_name: "${item['R_name']}",
                                        Receiver_phonenumber:
                                            "${item['R_phone']}",
                                        Receiver_address:
                                            "${item['R_address']}",
                                        Partner_name: "${item['D_name']}",
                                        Partner_phonenumber:
                                            "${item['D_phone']}",
                                        Est_time: "N/A",
                                        Total_price: "${item['Total_price']}",
                                        Dist: "${item['distance']}",
                                        Payment_mode: "${item['payment_mode']}",
                                        Status: "${item['status']}",
                                        S_OTP: "${item['SenderOTP']}",
                                        R_OTP: "${item['ReceiverOTP']}",
                                      )),
                            );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.02),
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.96,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 245, 245, 245),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 212, 212, 212),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Row(children: [
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                    decoration: BoxDecoration(
                                      color: item['status'] == 'A'
                                          ? const Color.fromARGB(
                                              255, 5, 85, 183)
                                          : Colors.green,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                    )),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text(
                                            "Order ID :",
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff000000),
                                              height: 22 / 18,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "${item['order_ID'].substring(0, 5)}",
                                            style: const TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff656565),
                                              height: 12 / 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "${item['Timestamp']}",
                                                style: const TextStyle(
                                                  fontFamily: "Inter",
                                                  fontSize: 10.5,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff656565),
                                                  height: 13 / 10.5,
                                                ),
                                                textAlign: TextAlign.center,
                                              )
                                            ],
                                          )
                                        ]),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "₹${item['Total_price']}",
                                        style: const TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff000000),
                                          height: 22 / 18,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        item['status'] == 'A'
                                            ? 'Delivering'
                                            : 'Success',
                                        style: item['status'] == 'A'
                                            ? const TextStyle(
                                                fontFamily: "Inter",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    255, 5, 85, 183),
                                                height: 22 / 18,
                                              )
                                            : const TextStyle(
                                                fontFamily: "Inter",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff056300),
                                                height: 22 / 18,
                                              ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}