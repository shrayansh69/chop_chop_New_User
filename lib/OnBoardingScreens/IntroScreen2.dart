import 'package:flutter/material.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({super.key, Key? Key});
  @override
  _IntroScreen2State createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  bool _showText = false;

  @override
  void initState() {
    super.initState();

    // Trigger the animation after a delay
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _showText = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: -MediaQuery.of(context).size.height * 0.28,
          left: -MediaQuery.of(context).size.width * 0.3,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 1.5,
            decoration: const BoxDecoration(
                color: Color(0xFFECE711),
                borderRadius: BorderRadius.all(Radius.circular(500))),
          ),
        ),
        Positioned(
            child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.09,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Image.asset("assets/fire.png"),
              ),
              Text(
                'Chop-Chop',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.07,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 185, 05, 05),
                  fontFamily: "BRUSHSCI",
                ),
              ),
              Text(
                'Deliver Faster than you think',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.04,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 0, 128, 0),
                  fontFamily: "BRUSHSCI",
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.23,
                child: Image.asset('assets/test.png'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.11,
                ),
                width: double.infinity,
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hyperlocal',
                        style: TextStyle(
                          color: Color.fromARGB(255, 185, 05, 05),
                          fontSize: 36,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.09,
                  left: MediaQuery.of(context).size.width * 0.11,
                ),
                width: double.infinity,
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Pick-up & Deliver from',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 128, 0),
                          fontSize: 22,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          height: 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: 1,
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.1,
                    left: MediaQuery.of(context).size.width * 0.11,
                  ),
                  width: double.infinity,
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '₹59/-',
                          style: TextStyle(
                            color: Color.fromARGB(255, 185, 05, 05),
                            fontSize: 40,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w900,
                            height: 0.03,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.05,
                  left: MediaQuery.of(context).size.width * 0.11,
                ),
                width: double.infinity,
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Terms & Conditions applied',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 128, 0),
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ))
      ]),
    );
  }
}
