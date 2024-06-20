import 'package:flutter/material.dart';

class OnlinePayment extends StatefulWidget {
  const OnlinePayment({super.key});

  @override
  State<OnlinePayment> createState() => _OnlinePaymentState();
}

class _OnlinePaymentState extends State<OnlinePayment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Payment")],
      ),
    );
  }
}
