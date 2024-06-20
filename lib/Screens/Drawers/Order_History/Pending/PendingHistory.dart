import 'dart:convert';
import 'package:cl/Screens/Drawers/Order_History/MainOrderHistory.dart';
import 'package:cl/Screens/Drawers/Order_History/Pending/Pending_.dart';
import 'package:cl/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<Map<String, dynamic>> data = [];

class PendingHistory extends StatefulWidget {
  const PendingHistory({super.key});

  @override
  State<PendingHistory> createState() => _PendingHistoryState();
}

class _PendingHistoryState extends State<PendingHistory> {
  @override
  void initState() {
    super.initState();
    fetchDataFromAPI2();
  }

  Future<void> fetchDataFromAPI2() async {
    final response = await http.get(Uri.parse(
        'https://chopchoplogistic.com/ordersList/api/list/$storedUID'));
    print(storedUID);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData is List) {
        if (mounted) {
          setState(() {
            data = List<Map<String, dynamic>>.from(jsonData);
            data.sort((a, b) => b['timestamp'].compareTo(a['timestamp']));
          });
        }
      } else {}
    } else {
      throw Exception('Failed to load data');
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
            data.where((item) => item['status'] == 'P').isEmpty
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
                        data.where((item) => item['status'] == 'P').length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = data
                          .where((item) => item['status'] == 'P')
                          .toList()[index];
                      OrderID = "${item['id']}${item['UID']}";

                      return GestureDetector(
                        onTap: () {
                          if (item['status'] == 'P') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Pending_(
                                        orderId: "${item['id']}",
                                        Sender_name: "${item['P_name']}",
                                        Sender_phonenumber:
                                            "${item['P_phone']}",
                                        Sender_address:
                                            "${item['P_flat']} ${item['P_area']} ",
                                        Parcelvalue: "${item['SYP']}",
                                        Parcelweight: "${item['weight']}",
                                        Parcelcateg: "${item['category']}",
                                        Receiver_name: "${item['D_name']}",
                                        Receiver_phonenumber:
                                            "${item['D_phone']}",
                                        Receiver_address:
                                            "${item['D_flat']} ${item['D_area']} ",
                                        Partner_name: "${item['D_name']}",
                                        Partner_phonenumber:
                                            "${item['D_name']}",
                                        Est_time: "N/A",
                                        Total_price: "${item['Total_fare']}",
                                        Dist: "${item['distance']}",
                                        Payment_mode: "${item['payment']}",
                                        Status: "${item['status']}",
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
                                      color: item['status'] == 'P'
                                          ? Colors.red
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
                                            "${item['id']}${item['UID'].substring(0, 5)}",
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
                                                "${item['timestamp']}",
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
                                        "₹${item['Total_fare']}",
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
                                        item['status'] == 'P'
                                            ? 'Pending'
                                            : 'Success',
                                        style: item['status'] == 'P'
                                            ? const TextStyle(
                                                fontFamily: "Inter",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xffB70605),
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
