import 'package:cl/OnBoardingScreens/OnBoardingScreen.dart';
import 'package:cl/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

String first20Digits = storedUID.substring(0, 7);

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

// ignore: camel_case_types
class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 212, 212, 212),
                          spreadRadius: 1,
                          blurRadius: 10)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: ProfilePicture(
                              name: NameConfirm,
                              radius: 31,
                              fontsize: 21,
                              random: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$selectedGender $NameConfirm',
                              style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000),
                                height: 22 / 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'User ID: ',
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff000000),
                                    height: 22 / 18,
                                  ),
                                ),
                                Text(
                                  first20Digits,
                                  style: const TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),
                                    height: 22 / 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Personal Details",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000),
                        height: 22 / 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 240, 240, 240),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Gender",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff636363),
                                  height: 22 / 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                selectedGender == 'Mr.' ? "Male" : "Female",
                                style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000),
                                  height: 22 / 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Contact No.",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff636363),
                                  height: 22 / 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "+91-$phoneNum",
                                style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000),
                                  height: 22 / 18,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: const Color(0xFFFFC700),
                            elevation: 0, // Text color
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Back to home',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.dashboard_outlined),
      //       label: 'Dashboard',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.history),
      //       label: 'History',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_rounded),
      //       label: 'Profile',
      //     ),
      //   ],
      //   currentIndex: 2,
      //   selectedItemColor: const Color.fromARGB(255, 0, 128, 0),
      //   onTap: (index) {
      //     switch (index) {
      //       case 0:
      //         Navigator.push(
      //             context, MaterialPageRoute(builder: (_) => test()));

      //       case 1:
      //         Navigator.push(
      //             context, MaterialPageRoute(builder: (_) => history()));
      //       case 2:
      //         Navigator.push(
      //             context, MaterialPageRoute(builder: (_) => profile()));
      //     }
      //   },
      // ),
    );
  }
}
