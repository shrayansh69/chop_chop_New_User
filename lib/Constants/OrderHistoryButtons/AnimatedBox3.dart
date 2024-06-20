import 'package:cl/Screens/Drawers/Order_History/Delivered/DeliveredHistory.dart';
import 'package:flutter/material.dart';

class LastButton extends StatefulWidget {
  const LastButton({super.key});

  @override
  _LastButtonState createState() => _LastButtonState();
}

class _LastButtonState extends State<LastButton> {
  bool isPressed = false;

  void onTap() {
    setState(() {
      isPressed = true; // Set isPressed to true when button is pressed
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        isPressed = false; // Reset isPressed after a short delay (100ms)
      });

      // Navigate to the desired screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DeliveredHistory()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        onTap(); // Call onTap function when button is pressed down
      },
      child: Center(
        child: Transform.scale(
          scale: isPressed ? 0.9 : 1.0, // Apply scale if button is pressed
          child: Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 11,
                  offset: const Offset(0, 4),
                ),
              ],
              color: Colors.white,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivered",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.keyboard_double_arrow_right_rounded,
                  color: Colors.green,
                  size: 35,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
