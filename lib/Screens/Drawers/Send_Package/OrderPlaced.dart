import 'package:cl/Screens/Drawers/Order_History/MainOrderHistory.dart';
import 'package:cl/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({super.key});

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const Order_History()));
    });
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Thank You."),
              content: const Text("Want to see order history?"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                  child: const Text("NO"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Order_History()),
                    );
                  },
                  child: const Text("YES"),
                )
              ],
            );
          },
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset(
                    "assets/orderplaced.gif",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text(
                "Order Placed Successfully.",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.008,
              ),
              const Text(
                "A big thank you for placing your\norder with us! We're on it!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              // SizedBox(
              //     width: MediaQuery.of(context).size.width * 0.9,
              //     height: MediaQuery.of(context).size.height * 0.07,
              //     child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         foregroundColor: Colors.black,
              //         backgroundColor: const Color(0xFFFFC700),
              //         elevation: 0, // Text color
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 20,
              //           vertical: 10,
              //         ),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(7.0),
              //         ),
              //       ),
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const PendingHistory()),
              //         );
              //       },
              //       child: const Row(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           Text(
              //             'Return to My Orders',
              //             style: TextStyle(
              //               fontSize: 18,
              //               fontWeight: FontWeight.w600,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ],
              //       ),
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}
