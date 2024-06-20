import 'package:flutter/material.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key, Key? Key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: -MediaQuery.of(context).size.height * 0.22,
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
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                ),
                child: const SizedBox(
                  child: Text(
                    'We Pick-up & Deliver',
                    style: TextStyle(
                      color: Color.fromARGB(255, 185, 05, 05),
                      fontSize: 30,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      height: 0.03,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.26,
                child: Image.asset('assets/test2.png'),
              ),
              const SizedBox(
                height: 40,
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
                        text: '& ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 128, 0),
                          fontSize: 36,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0.03,
                        ),
                      ),
                      TextSpan(
                        text: 'So ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 128, 0),
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
                        text: 'Much More....',
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
            ],
          ),
        ))
      ]),
    );
  }
}
