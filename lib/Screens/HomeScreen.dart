import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cl/Constants/location.dart';
import 'package:cl/OnBoardingScreens/OnBoardingScreen.dart';
import 'package:cl/Screens/Drawers/Help_.dart';
import 'package:cl/Screens/Drawers/Order_History/MainOrderHistory.dart';
import 'package:cl/Screens/Drawers/Profile_.dart';
import 'package:cl/Screens/Drawers/Send_Package/SendPackage.dart';
import 'package:cl/Screens/SplashScreen.dart';
import 'package:cl/notification.dart';
import 'package:cl/version/version.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
// Logout

final nameStorage = GetStorage();
String storedUID = nameStorage.read('UID').trim() ?? '';
// ignore: non_constant_identifier_names
String NameConfirm = nameStorage.read('nameC') ?? '';
String phoneNum = nameStorage.read('Contact') ?? '';
String sourcePage = '';

class Home extends GetView<Homec> {
  const Home({super.key, Key? Key});

  @override
  Widget build(BuildContext context) {
    print(nameStorage.read('nameC'));
    print(storedUID);
    Get.put(Homec());
    sourcePage = 'Home';
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Color(0xffB70605),
                size: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Text(
                          controller.locality.value,
                          style: const TextStyle(
                              color: Color(0xffB70605),
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => Text(
                      controller.address.value,
                      style: const TextStyle(
                          color: Color(0xffB70605),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDataFromAPI2();
    notoficationsServices.initialiseNotification(context);
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      fetchDataFromAPI3();
    });
  }

  NotoficationsServices notoficationsServices = NotoficationsServices();
  Future<void> fetchDataFromAPI3() async {
    try {
      final response = await http.get(Uri.parse(
          // 'https://chopchoplogistic.com/acceptedOrder/api/notification/OqEfIpMgDtKmTcN'));
          'https://chopchoplogistic.com/acceptedOrder/api/notification/${nameStorage.read('uid')}'));
      print(response.statusCode);
      if (response.statusCode == 200) {
        if (response.body == '') {
          print(response.body);
        } else {
          String header = jsonDecode(response.body)['Header'];
          String template = jsonDecode(response.body)['Template'];
          notoficationsServices.sendNotification(header, template);
        }
      } else {
        print('Request failed with status1: ${response.statusCode}');
        // Return a default value or throw an exception as needed
        // or throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      // Return a default value or throw an exception as needed
      // or throw Exception('Failed to fetch data: $e');
    }
  }

  Future<void> fetchDataFromAPI2() async {
    final response =
        await http.get(Uri.parse('https://chopchoplogistic.com/api/api/list'));

    if (response.statusCode == 200) {
      final responseData = (response.body);
      // print("hello");
      if (responseData != '1.0.0+7') {
        print("hello");
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => version()),
        );
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Alert"),
              content: const Text("Are you sure you want to exit ?"),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("NO"),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(exit(1)),
                  child: const Text("YES"),
                )
              ],
            );
          },
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
              backgroundColor: const Color(0xFFECE711),
              elevation: 0,
              centerTitle: true,
              title: const Home()
              // Container(
              //   margin: EdgeInsets.only(
              //     right: MediaQuery.of(context).size.width * 0.1,
              //   ),
              //   child: const Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Icon(
              //         Icons.location_on,
              //         color: Color(0xffB70605),
              //       ),
              //       Text(
              //         ' Dehradun, India',
              //         style: TextStyle(
              //           color: Color(0xffB70605),
              //           fontSize: 20,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Color(0xFFECE711),
                    ),
                    child: Container(
                      child: Row(
                        children: [
                          ProfilePicture(
                            name: NameConfirm,
                            radius: 31,
                            fontsize: 21,
                            random: true,
                          ),
                          // ignore: avoid_unnecessary_containers
                          Container(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05,
                              left: MediaQuery.of(context).size.height * 0.025,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Welcome!',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54),
                                ),
                                Text(
                                  '$selectedGender ${nameStorage.read('nameC')}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffB70605)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    decoration: BoxDecoration(
                        color: const Color(0xFFECE711).withOpacity(0.28),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05),
                          width: 45,
                          height: 45,
                          child: SvgPicture.asset('assets/drawer/HOME.svg'),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        const Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF008000),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Send_Package()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    decoration: BoxDecoration(
                        color: const Color(0xFFECE711).withOpacity(0.28),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05),
                          width: 50,
                          height: 50,
                          child:
                              SvgPicture.asset('assets/drawer/SENDPACKAGE.svg'),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        const Text(
                          'Send a Package',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF008000),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Order_History()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    decoration: BoxDecoration(
                        color: const Color(0xFFECE711).withOpacity(0.28),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05),
                          width: 50,
                          height: 50,
                          child: SvgPicture.asset('assets/drawer/ORDERS.svg'),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        const Text(
                          'My Orders',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF008000),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const profile()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    decoration: BoxDecoration(
                        color: const Color(0xFFECE711).withOpacity(0.28),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05),
                          width: 50,
                          height: 50,
                          child: SvgPicture.asset('assets/drawer/PROFILE.svg'),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        const Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF008000),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Help()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    decoration: BoxDecoration(
                        color: const Color(0xFFECE711).withOpacity(0.28),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05),
                          width: 50,
                          height: 50,
                          child: SvgPicture.asset('assets/drawer/HELP.svg'),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        const Text(
                          'Help',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF008000),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () async {
                    // ignore: no_leading_underscores_for_local_identifiers
                    _performLogout() async {
                      final introdata = GetStorage();
                      await introdata.remove("displayed");
                      // Add any other logout logic here

                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SplashScreen()),
                      );
                    }

                    await _performLogout();
                  },
                  child: Container(
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    decoration: BoxDecoration(
                        color: const Color(0xFFECE711).withOpacity(0.28),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05),
                          width: 47,
                          height: 47,
                          child: SvgPicture.asset('assets/drawer/SIGNOUT.svg'),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF008000),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () async {
                //     try {
                //       await FirebaseAuth.instance.signOut();
                //       Navigator.of(context).pushAndRemoveUntil(
                //         MaterialPageRoute(builder: (context) => LoginFace()),
                //         (Route<dynamic> route) => false,
                //       );
                //     } catch (e) {
                //       print("Error signing out: $e");
                //     }
                //   },
                //   child: Container(
                //     margin: EdgeInsets.all(
                //         MediaQuery.of(context).size.width * 0.02),
                //     decoration: BoxDecoration(
                //         color: const Color(0xFFECE711).withOpacity(0.28),
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(10.0))),
                //     width: MediaQuery.of(context).size.width * 0.1,
                //     height: MediaQuery.of(context).size.height * 0.08,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Container(
                //           padding: EdgeInsets.only(
                //               left: MediaQuery.of(context).size.width * 0.05),
                //           width: 50,
                //           height: 50,
                //           child: SvgPicture.asset('assets/drawer/ABOUT.svg'),
                //         ),
                //         const SizedBox(
                //           width: 20.0,
                //         ),
                //         const Text(
                //           'Logout',
                //           style: TextStyle(
                //             fontSize: 19,
                //             fontWeight: FontWeight.w600,
                //             color: Color(0xFF008000),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    MediaQuery.of(context).size.width * 0.1,
                    MediaQuery.of(context).size.width * 0.3,
                    MediaQuery.of(context).size.width * 0.1,
                    MediaQuery.of(context).size.width * 0.1,
                  ),
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.37,
                  decoration: const BoxDecoration(
                    color: Color(0xFFECE711),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02),
                          child: ProfilePicture(
                            name: NameConfirm,
                            radius: 31,
                            fontsize: 21,
                          ),
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02,
                            left: MediaQuery.of(context).size.height * 0.025,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Welcome!',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                              ),
                              AutoSizeText(
                                '$selectedGender ${nameStorage.read('nameC')}',
                                style: const TextStyle(
                                    fontSize: 29,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffB70605)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                      left: MediaQuery.of(context).size.height * 0.03,
                      right: MediaQuery.of(context).size.height * 0.05),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Services',
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.025,
                    left: MediaQuery.of(context).size.height * 0.02,
                  ),
                  height: 170,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Send_Package(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.easeInOut;
                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);
                            return SlideTransition(
                                position: offsetAnimation, child: child);
                          },
                        ),
                      );
                    },
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: const <Widget>[
                        ServicesOption(
                            imagePath: 'assets/icons/grocery.png',
                            text: 'Grocery'),
                        ServicesOption(
                            imagePath: 'assets/icons/clothes.png',
                            text: 'Clothes'),
                        ServicesOption(
                            imagePath: 'assets/icons/gifts.jpg', text: 'Gifts'),
                        ServicesOption(
                            imagePath: 'assets/icons/tiffin.png',
                            text: 'Tiffin'),
                        ServicesOption(
                            imagePath: 'assets/icons/office.png',
                            text: 'Office'),
                        ServicesOption(
                            imagePath: 'assets/icons/others.png',
                            text: 'Others'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Image.asset(
                        'assets/111.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Have you missed ',
                            style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFFECE711),
                                fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            'something important?',
                            style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFFECE711),
                                fontWeight: FontWeight.w600),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'We will reach you without delay.',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffB70605),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const Send_Package(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(1.0, 0.0);
                                    const end = Offset.zero;
                                    const curve = Curves.easeInOut;
                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation =
                                        animation.drive(tween);
                                    return SlideTransition(
                                        position: offsetAnimation,
                                        child: child);
                                  },
                                ),
                              );
                            }, // Replace with your button widget

                            child: Container(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height *
                                      0.015),
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.015),
                              width: 140,
                              height: 38,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFECE711),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              child: const Row(
                                children: [
                                  Text(
                                    'Create Order',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.green,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class ServicesOption extends StatelessWidget {
  final String imagePath;
  final String text;

  const ServicesOption({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(58, 236, 231, 17),
        borderRadius: BorderRadius.all(Radius.circular(13.0)),
      ),
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.009),
      width: 125,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(imagePath),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
