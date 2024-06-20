import 'package:cl/Constants/OrderHistoryButtons/AnimatedBox.dart';
import 'package:cl/Constants/OrderHistoryButtons/AnimatedBox2.dart';
import 'package:cl/Constants/OrderHistoryButtons/AnimatedBox3.dart';
import 'package:cl/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

String OrderID = "";

class Order_History extends StatefulWidget {
  const Order_History({super.key});

  @override
  State<Order_History> createState() => _Order_HistoryState();
}

class _Order_HistoryState extends State<Order_History> {
  // List<Map<String, dynamic>> data = [];
  final double _containerHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    var animatedContainerExample = AnimatedContainerExample;
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
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Orders',
          style: TextStyle(color: Colors.black),
        ),
      ),
      //  title: Text('ID: ${item['id']}'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          const AnimatedContainerExample(),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07,
              bottom: MediaQuery.of(context).size.height * 0.01,
            ),
            child: const Text(
              "Please wait!  Chop Chop Delivery Partner will accept your order very soon",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.04,
          ),
          const AnimatedContainerExample1(),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07,
              bottom: MediaQuery.of(context).size.height * 0.01,
            ),
            child: const Text(
              "Chop Chop Delivery Partner accepted your order & on the way for delivery.",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.07,
          ),
          const LastButton(),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07,
              bottom: MediaQuery.of(context).size.height * 0.01,
            ),
            child: const Text(
              "Succesfully Delivered orders.",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
