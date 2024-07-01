import 'package:flutter/material.dart';

class loaderScreen extends StatefulWidget {
  const loaderScreen({super.key});

  @override
  State<loaderScreen> createState() => _loaderScreenState();
}

class _loaderScreenState extends State<loaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
