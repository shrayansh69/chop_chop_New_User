import 'package:cl/Screens/Drawers/Send_Package/SendPackage.dart';
import 'package:flutter/material.dart';

class failed extends StatefulWidget {
  const failed({super.key});

  @override
  State<failed> createState() => _failedState();
}

class _failedState extends State<failed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Image.asset(
                        "assets/logo.png",
                        width: 80,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      "Payment Failed",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Send_Package()));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.060,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 185, 05, 05))),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Try Again",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 185, 05, 05)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
          // ? loginScreen()
          ,
        ],
      ),
    );
  }
}
