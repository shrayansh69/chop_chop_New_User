import 'package:cl/OnBoardingScreens/OnBoardingScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnBoardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/fire.png",
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              ],
            ),
            Text(
              'Chop-Chop',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.045,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 185, 05, 05),
                fontFamily: "BRUSHSCI",
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'Deliver Faster Than You Think',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 0, 128, 0),
                fontFamily: "BRUSHSCI",
              ),
            ),
          ]),
    );
  }
}
