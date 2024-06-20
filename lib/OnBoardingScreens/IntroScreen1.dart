import 'package:flutter/material.dart';

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: -MediaQuery.of(context).size.height * 0.27,
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
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Welcome to',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF008000),
                  fontSize: 55,
                  fontFamily: 'Inika',
                  fontWeight: FontWeight.w400,
                  height: 0.02,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.09,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
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
                height: MediaQuery.of(context).size.height * 0.15,
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
                        text: 'We ',
                        style: TextStyle(
                          color: Color(0xFF008000),
                          fontSize: 36,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0.03,
                        ),
                      ),
                      TextSpan(
                        text: 'Pickup',
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
                  top: MediaQuery.of(context).size.width * 0.11,
                  left: MediaQuery.of(context).size.width * 0.11,
                ),
                width: double.infinity,
                child: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '& ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 185, 05, 05),
                          fontSize: 36,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0.03,
                        ),
                      ),
                      TextSpan(
                        text: 'Deliver',
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
