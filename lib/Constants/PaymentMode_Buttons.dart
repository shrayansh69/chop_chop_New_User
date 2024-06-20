import 'package:cl/Screens/Drawers/Send_Package/SendPackage.dart';
import 'package:flutter/material.dart';

class MyButtonRow extends StatefulWidget {
  const MyButtonRow({super.key});

  @override
  _MyButtonRowState createState() => _MyButtonRowState();
}

class _MyButtonRowState extends State<MyButtonRow> {
  int selectedButton = 1; // Initialize to the first button

  void handleButtonPress(int buttonNumber) {
    setState(() {
      selectedButton = buttonNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // --
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.05,
          child: ElevatedButton(
            onPressed: () {
              handleButtonPress(1);

              setState(() {
                SP_payment = "Online";
              });
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor:
                  selectedButton == 1 ? const Color(0xFFFFC700) : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(18.0), // Set the border radius here
                side: const BorderSide(
                    color: Color(0xFFFFC700),
                    width: 2.0), // Set the border color and width
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.card_membership,
                  color: selectedButton == 1
                      ? Colors.white
                      : const Color(0xFFFFC700),
                ),
                const SizedBox(
                  width: 3.0,
                ),
                const Text(
                  'Online',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
        // --
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.05,
          child: ElevatedButton(
            onPressed: () {
              handleButtonPress(2);
              setState(() {
                SP_payment = "Cash";
              });
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor:
                  selectedButton == 2 ? const Color(0xFFFFC700) : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(18.0), // Set the border radius here
                side: const BorderSide(
                    color: Color(0xFFFFC700),
                    width: 2.0), // Set the border color and width
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.money_rounded,
                  color: selectedButton == 2
                      ? Colors.white
                      : const Color(0xFFFFC700),
                ),
                const SizedBox(
                  width: 3.0,
                ),
                const Text(
                  'Cash',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
