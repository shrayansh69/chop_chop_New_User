import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cl/Constants/Dropdown.dart';
import 'package:cl/Constants/PaymentMode_Buttons.dart';
import 'package:cl/OnBoardingScreens/OnBoardingScreen.dart';
import 'package:cl/Screens/Drawers/Send_Package/Daddress.dart';
import 'package:cl/Screens/Drawers/Send_Package/OrderSummary.dart';
import 'package:cl/Screens/Drawers/Send_Package/address.dart';
import 'package:cl/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

bool isLoading = false;
double x = 0;
String SP_weight = "";
String SP_category = "";
String SP_payment = "Online";
String SP_UID = UID;
// new variables
String pflat = "";
String paddress = "";
String pDaddress = "";
String pbuild = "";
String phr = "";
String sflat = "";
String saddress = "";
String sDaddress = "";
String sbuild = "";
String shr = "";
// Old variables
String SP_P_name = "";
String SP_P_phone = "";
String SP_P_flat = "";
String SP_P_area = "";
String SP_P_pincode = "";
String SP_P_city = "";
String SP_P_state = "";
String SP_D_name = "";
String SP_D_phone = "";
String SP_D_flat = "";
String SP_D_area = "";
String SP_D_pincode = "";
String SP_D_city = "";
String SP_D_state = "";
String SP_SYP = "0";
String Sender_address = "";
String Receiver_address = "";
double money = 0;
double parcel_sec_charge = 0;
double total_charge = 0;
double delivery_part_profir = 0;
double spSypDouble = 0;
TextEditingController nameController1 = TextEditingController();
TextEditingController nameController2 = TextEditingController();
TextEditingController nameController3 = TextEditingController();
TextEditingController nameController4 = TextEditingController();
TextEditingController nameController5 = TextEditingController();
TextEditingController nameController6 = TextEditingController();
TextEditingController nameController7 = TextEditingController();
TextEditingController nameController8 = TextEditingController();
TextEditingController nameController9 = TextEditingController();
TextEditingController nameController10 = TextEditingController();
TextEditingController nameController11 = TextEditingController();
TextEditingController nameController12 = TextEditingController();
TextEditingController nameController13 = TextEditingController();
TextEditingController nameController14 = TextEditingController();
TextEditingController nameController15 = TextEditingController();
TextEditingController nameController16 = TextEditingController();
bool isChecked9 = false;
bool isChecked3 = false;
bool isChecked2 = false;

class Send_Package extends StatefulWidget {
  const Send_Package({super.key});

  @override
  State<Send_Package> createState() => _Send_PackageState();
}

class _Send_PackageState extends State<Send_Package> {
// Sending Package Variables

// End of Sending Package Variables
//Text Controllers ---->>>>

  @override
  Widget build(BuildContext context) {
    String trimmedAddress =
        (paddress.length <= 30) ? paddress : paddress.substring(0, 30) + '...';
    pDaddress = (pflat +
        (pflat == '' ? '' : ", ") +
        pbuild +
        (pbuild == '' ? '' : ",\n") +
        trimmedAddress +
        (phr == '' ? '' : "\nSuggestion : ") +
        phr);
    print("pDaddress :" + pDaddress);

    String trimmedAddress2 =
        (saddress.length <= 30) ? saddress : saddress.substring(0, 30) + '...';
    sDaddress = (sflat +
        (sflat == '' ? '' : ", ") +
        sbuild +
        (sbuild == '' ? '' : ",\n") +
        trimmedAddress2 +
        (shr == '' ? '' : "\nSuggestion : ") +
        shr);

    if (sourcePage == 'Home') {
      pDaddress = '';
      trimmedAddress2 = '';
      trimmedAddress = '';
      sDaddress = '';
      nameController1 = TextEditingController();
      nameController2 = TextEditingController();
      nameController3 = TextEditingController();
      nameController4 = TextEditingController();
      nameController5 = TextEditingController();
      nameController6 = TextEditingController();
      nameController7 = TextEditingController();
      nameController8 = TextEditingController();
      nameController9 = TextEditingController();
      nameController10 = TextEditingController();
      nameController11 = TextEditingController();
      nameController12 = TextEditingController();
      nameController13 = TextEditingController();
      nameController14 = TextEditingController();
      nameController15 = TextEditingController();
      nameController16 = TextEditingController();
    }
    sourcePage = 'Package';
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Send a Package',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                children: [
                  const Text(
                    "Pickup Address",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.25,
                    ),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.06,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: SvgPicture.asset(
                            'assets/SendPackage/pickupadd.svg')),
                  )
                ],
              ),

              const Text(
                'Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                // height: MediaQuery.of(context).size.height * 0.05,
                child: TextFormField(
                  controller: nameController1,
                  onChanged: (value) {
                    SP_P_name = value;
                  },
                  enabled: isChecked2 ? false : true,
                  decoration: InputDecoration(
                    hintText: isChecked2
                        ? nameStorage.read('nameC')
                        : 'Enter Sender\'s name',
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFFFFC700), width: 2.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFFFFC700), width: 2.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFFFFC700), width: 2.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 20.0, // Set the desired width
                    height: 20.0, // Set the desired height
                    decoration: BoxDecoration(
                      shape: BoxShape
                          .rectangle, // Use BoxShape.circle for a circular checkbox
                      borderRadius: BorderRadius.circular(
                          4.0), // Set the desired border radius
                      border: Border.all(
                        color: const Color.fromARGB(
                            255, 124, 124, 124), // Set the border color
                        width: 0.05, // Set the border width
                      ),
                      color: isChecked2
                          ? const Color(0xFFFFC700)
                          : Colors.transparent, // Set the checkbox fill color
                    ),
                    child: Checkbox(
                      value: isChecked2,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked2 = newValue!;
                        });
                      },
                      activeColor: const Color(
                          0xFFFFC700), // Set the color of the checkmark
                      checkColor:
                          Colors.white, // Set the color of the checkmark itself
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  const Text(
                    "Use my contact for this booking",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              const Text(
                'Mobile Number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                // height: MediaQuery.of(context).size.height * 0.05,
                child: TextField(
                  controller: nameController2,
                  onChanged: (value) {
                    SP_P_phone = value;
                  },
                  enabled: isChecked2 ? false : true,
                  decoration: InputDecoration(
                    hintText: isChecked2
                        ? phoneNum.toString()
                        : 'Enter Sender\'s Mobile Number',
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFFFFC700), width: 2.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFFFFC700), width: 2.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFFFFC700), width: 2.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
              // --
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              Text(
                "Pickup Address",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SAddress()),
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.128,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SAddress()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 0),
                        backgroundColor: Colors.white,
                        shadowColor: Colors.white,
                        // backgroundColor: Colors.white,
                        foregroundColor: Colors.white,
                        surfaceTintColor: Colors.white,
                        side: BorderSide(color: Color(0xFFFFC700), width: 2.0),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            pDaddress == "" ? 'Pickup Address' : pDaddress,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 98, 98, 98),
                              // Add other text styles as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                children: [
                  const Text(
                    "Delivery Address",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.25,
                    ),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.06,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: SvgPicture.asset(
                            'assets/SendPackage/deliveryadd.svg')),
                  )
                ],
              ),
              // --

              const Text(
                'Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                // height: MediaQuery.of(context).size.height * 0.05,
                child: TextField(
                  controller: nameController8,
                  onChanged: (value) {
                    SP_D_name = value;
                  },
                  enabled: isChecked3 ? false : true,
                  decoration: InputDecoration(
                    hintText: isChecked3
                        ? nameStorage.read('nameC')
                        : 'Enter Receiver\'s name',
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFFFFC700), width: 2.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFFFFC700), width: 2.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFFFFC700), width: 2.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 20.0, // Set the desired width
                    height: 20.0, // Set the desired height
                    decoration: BoxDecoration(
                      shape: BoxShape
                          .rectangle, // Use BoxShape.circle for a circular checkbox
                      borderRadius: BorderRadius.circular(
                          4.0), // Set the desired border radius
                      border: Border.all(
                        color: const Color.fromARGB(
                            255, 124, 124, 124), // Set the border color
                        width: 0.05, // Set the border width
                      ),
                      color: isChecked3
                          ? const Color(0xFFFFC700)
                          : Colors.transparent, // Set the checkbox fill color
                    ),
                    child: Checkbox(
                      value: isChecked3,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked3 = newValue!;
                        });
                      },
                      activeColor: const Color(
                          0xFFFFC700), // Set the color of the checkmark
                      checkColor:
                          Colors.white, // Set the color of the checkmark itself
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  const Text(
                    "Use my contact for this booking",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              const Text(
                'Mobile Number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                // height: MediaQuery.of(context).size.height * 0.05,
                child: TextField(
                  controller: nameController9,
                  onChanged: (value) {
                    SP_D_phone = value;
                  },
                  enabled: isChecked3 ? false : true,
                  decoration: InputDecoration(
                    hintText: isChecked3
                        ? phoneNum.toString()
                        : 'Enter Receive\'s Mobile Number',
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFFFFC700), width: 2.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFFFFC700), width: 2.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFFFFC700), width: 2.0),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
              // --
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.04,
              ),
              const Text(
                'Delivery Address',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SAddress()),
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.128,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DAddress()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 0),
                        backgroundColor: Colors.white,
                        shadowColor: Colors.white,
                        // backgroundColor: Colors.white,
                        foregroundColor: Colors.white,
                        surfaceTintColor: Colors.white,
                        side: BorderSide(color: Color(0xFFFFC700), width: 2.0),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            sDaddress == "" ? 'Delivery Address' : sDaddress,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 98, 98, 98),
                              // Add other text styles as needed
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // const Text(
              //   'Flat,Housing no.,Building, Apartment',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.width * 0.02,
              // ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   child: TextField(
              //     controller: nameController10,
              //     onChanged: (value) {
              //       SP_D_flat = value;
              //     },
              //     decoration: InputDecoration(
              //       hintText: 'Enter Your Flat,Housing no.,Building, Apartment',
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: const BorderSide(
              //             color: Color(0xFFFFC700), width: 2.0),
              //         borderRadius: BorderRadius.circular(6.0),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: const BorderSide(
              //             color: Color(0xFFFFC700), width: 2.0),
              //         borderRadius: BorderRadius.circular(6.0),
              //       ),
              //     ),
              //   ),
              // ),
              // --
              // SizedBox(
              //   height: MediaQuery.of(context).size.width * 0.06,
              // ),
              // const Text(
              //   'Area,street ,sector',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.width * 0.02,
              // ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   child: TextField(
              //     controller: nameController11,
              //     onChanged: (value) {
              //       SP_D_area = value;
              //     },
              //     decoration: InputDecoration(
              //       hintText: 'Enter Your Areea, street, sector',
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: const BorderSide(
              //             color: Color(0xFFFFC700), width: 2.0),
              //         borderRadius: BorderRadius.circular(6.0),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: const BorderSide(
              //             color: Color(0xFFFFC700), width: 2.0),
              //         borderRadius: BorderRadius.circular(6.0),
              //       ),
              //     ),
              //   ),
              // ),

              // // --
              // SizedBox(
              //   height: MediaQuery.of(context).size.width * 0.06,
              // ),
              // const Text(
              //   'City',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.width * 0.02,
              // ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   child: TextField(
              //     controller: nameController12,
              //     onChanged: (value) {
              //       SP_D_city = value;
              //     },
              //     decoration: InputDecoration(
              //       hintText: 'Enter Your City',
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: const BorderSide(
              //             color: Color(0xFFFFC700), width: 2.0),
              //         borderRadius: BorderRadius.circular(6.0),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: const BorderSide(
              //             color: Color(0xFFFFC700), width: 2.0),
              //         borderRadius: BorderRadius.circular(6.0),
              //       ),
              //     ),
              //   ),
              // ),
              // // --
              // SizedBox(
              //   height: MediaQuery.of(context).size.width * 0.06,
              // ),
              // const Text(
              //   'State',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.width * 0.02,
              // ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   child: TextField(
              //     controller: nameController13,
              //     onChanged: (value) {
              //       SP_D_state = value;
              //     },
              //     decoration: InputDecoration(
              //       hintText: 'Enter Your State',
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: const BorderSide(
              //             color: Color(0xFFFFC700), width: 2.0),
              //         borderRadius: BorderRadius.circular(6.0),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: const BorderSide(
              //             color: Color(0xFFFFC700), width: 2.0),
              //         borderRadius: BorderRadius.circular(6.0),
              //       ),
              //     ),
              //   ),
              // ),
              // // --
              // SizedBox(
              //   height: MediaQuery.of(context).size.width * 0.06,
              // ),
              // const Text(
              //   'Pincode',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.width * 0.02,
              // ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   child: TextField(
              //     controller: nameController14,
              //     onChanged: (value) {
              //       SP_D_pincode = value;
              //     },
              //     decoration: InputDecoration(
              //       hintText: 'Enter Your Pincode',
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: const BorderSide(
              //             color: Color(0xFFFFC700), width: 2.0),
              //         borderRadius: BorderRadius.circular(6.0),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: const BorderSide(
              //             color: Color(0xFFFFC700), width: 2.0),
              //         borderRadius: BorderRadius.circular(6.0),
              //       ),
              //     ),
              //   ),
              // ),

              // Center(
              //   child: Container(
              //     padding: EdgeInsets.only(
              //         left: MediaQuery.of(context).size.width * 0.05,
              //         top: MediaQuery.of(context).size.height * 0.02),
              //     width: MediaQuery.of(context).size.width *
              //         0.9, // Set the desired width
              //     height: MediaQuery.of(context).size.height *
              //         0.36, // Set the desired height
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(
              //           10), // Set the desired border radius
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.grey
              //               .withOpacity(0.3), // Set the shadow color
              //           spreadRadius: 2, // Set how far the shadow spreads
              //           blurRadius: 11, // Set the amount of blur
              //           offset: const Offset(0, 4), // Set the offset
              //         ),
              //       ],
              //       color: Colors.white, // Set the background color
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const AutoSizeText(
              //           'Secure your parcel',
              //           style: TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.w600,
              //           ),
              //           minFontSize: 15,
              //           maxFontSize: 18,
              //         ),
              //         const AutoSizeText(
              //           '*Optional',
              //           style: TextStyle(
              //               fontSize: 10,
              //               fontWeight: FontWeight.w400,
              //               color: Colors.green),
              //           minFontSize: 10,
              //           maxFontSize: 12,
              //         ),
              //         SizedBox(
              //           height: MediaQuery.of(context).size.width * 0.05,
              //         ),
              //         SizedBox(
              //           width: MediaQuery.of(context).size.width * 0.8,
              //           child: TextField(
              //             controller: nameController15,
              //             onSubmitted: (value) {
              //               SP_SYP = value;

              //               try {
              //                 // Attempt to parse the string to a double
              //                 spSypDouble = double.parse(SP_SYP);
              //               } catch (e) {
              //                 // Handle the exception, for example, set the value to 0
              //                 print('Error parsing double: $e');
              //                 spSypDouble = 0;
              //               }
              //               SP_SYP = spSypDouble.toString();
              //               parcel_sec_charge = spSypDouble * 0.03;
              //               // Continue with the rest of your code using spSypDouble
              //             },
              //             decoration: InputDecoration(
              //               hintText: 'Declare Parcel Cost',
              //               enabledBorder: OutlineInputBorder(
              //                 borderSide: const BorderSide(
              //                     color: Color(0xFFFFC700), width: 2.0),
              //                 borderRadius: BorderRadius.circular(6.0),
              //               ),
              //               focusedBorder: OutlineInputBorder(
              //                 borderSide: const BorderSide(
              //                     color: Color(0xFFFFC700), width: 2.0),
              //                 borderRadius: BorderRadius.circular(6.0),
              //               ),
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           height: MediaQuery.of(context).size.width * 0.01,
              //         ),
              //         AutoSizeText(
              //           '${double.parse(parcel_sec_charge.toStringAsFixed(2))} : Additional charges for securing parcel',
              //           style: const TextStyle(
              //               fontSize: 15,
              //               fontWeight: FontWeight.w500,
              //               color: Colors.grey),
              //           maxFontSize: 15,
              //           minFontSize: 12,
              //         ),
              //         SizedBox(
              //           height: MediaQuery.of(context).size.width * 0.01,
              //         ),
              //         const FittedBox(
              //           fit: BoxFit
              //               .scaleDown, // You can change the BoxFit as needed
              //           child: Text(
              //             'Secure your important or fragile packages to retrieve the \nvalue in case of loss or damage done during delivery.\nWe charge a fee of 3% of the above value you declare above.\nValid upto - 30000. ',
              //             style: TextStyle(
              //               fontSize: 12,
              //               fontWeight: FontWeight.w400,
              //               color: Colors.grey,
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),

              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              const Text(
                'Select Weight',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Text(
                '*Should accomodate on two wheeler',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFFFC700), // Set the border color
                    width: 2.0, // Set the border width
                  ),
                  borderRadius:
                      BorderRadius.circular(6.0), // Optional: Set border radius
                ),
                child: const DropdownButtonExample(),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              const Text(
                'Item Type',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Form(
                    child: TextFormField(
                      controller: nameController16,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        SP_category = value;
                      },
                      decoration: InputDecoration(
                        hintText:
                            'E.g - Frazile, Blanket, Clothes, Bag, Books, etc.',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFC700), width: 2.0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFC700), width: 2.0),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  )),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    width: 24.0, // Set the desired width
                    height: 24.0, // Set the desired height
                    decoration: BoxDecoration(
                      shape: BoxShape
                          .rectangle, // Use BoxShape.circle for a circular checkbox
                      borderRadius: BorderRadius.circular(
                          4.0), // Set the desired border radius
                      border: Border.all(
                        color: Colors.black, // Set the border color
                        width: 2.0, // Set the border width
                      ),
                      color: isChecked9
                          ? const Color(0xFFFFC700)
                          : Colors.transparent, // Set the checkbox fill color
                    ),
                    child: Checkbox(
                      value: isChecked9,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked9 = newValue!;
                        });
                      },
                      activeColor: const Color(
                          0xFFFFC700), // Set the color of the checkmark
                      checkColor:
                          Colors.white, // Set the color of the checkmark itself
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.2,
                  ),
                  const Text(
                    "Prefer Courier with Delivery Bag",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              const Text(
                'Payment',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              const MyButtonRow(),

              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.07,
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
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                      if (isChecked2) {
                        print(nameStorage.read('nameC'));
                        SP_P_name = nameStorage.read('nameC');
                        SP_P_phone = phoneNum.toString();
                        print(SP_P_name);
                      }
                      // if (isChecked) {
                      //   paddress = SelectedAddress;
                      // }
                      // if (isChecked95) {
                      //   saddress = SelectedAddress;
                      // }
                      if (isChecked3) {
                        SP_D_name = nameStorage.read('nameC');
                        SP_D_phone = phoneNum.toString();
                      }
                    });

                    if (SP_P_name == "" ||
                            SP_P_phone == "" ||
                            paddress == "" ||
                            SP_D_name == "" ||
                            SP_D_phone == "" ||
                            saddress == "" ||
                            SP_weight == "" ||
                            SP_category == "" ||
                            SP_payment == "" ||
                            money == "" ||
                            x == "" ||
                            delivery_part_profir == ""

                        // Add similar checks for other fields...
                        ) {
                      // Show an error message or take appropriate action
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Add the desired border radius here.
                            ),
                            title: const Text('Error'),
                            content:
                                const Text('Please fill in all the fields.'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text(
                                  'OK',
                                  style: TextStyle(
                                      color: Color(0xFFFFC700), fontSize: 18),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // All fields are filled, proceed to OrderSummary
                      Sender_address = paddress;
                      Receiver_address = sDaddress;
                      print(Sender_address);
                      print(Receiver_address);
                      print(jsonEncode(paddress));
                      print(jsonEncode(saddress));
                      final response = await http.get(Uri.parse(
                          'https://chopchoplogistic.com/distance-api/api/distance?address1="${Uri.encodeComponent(paddress)}"&address2=${Uri.encodeComponent(saddress)}'));
                      if (response.statusCode == 200) {
                        final dynamic data = json.decode(response.body);
                        money = data.toDouble(); // Convert int to double
                        x = calculate_fare(money);
                        print(x);
                      } else {
                        print("Invalid address");
                      }
                      print(x);
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderSummary()),
                      );
                    }
                    ;
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Proceed',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              FutureBuilder(
                future: Future.delayed(const Duration(
                    seconds:
                        1)), // Replace with your actual data loading function
                builder: (context, snapshot) {
                  if (isLoading) {
                    isLoading = false;
                    print("Loaded");
                    return Center(
                        child: Image.asset(
                      "assets/loader.gif",
                      width: 150,
                      height: 150,
                    ));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              const Text(
                'By Clicking Proceed, you are forwarding your request to nearest Chop-Chop delivery partner.',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double totalFareCalculate = 0;

double calculate_fare(double distanceTravelInKm) {
  double temp = 0;
  double fareKm = 0;

  if (distanceTravelInKm <= 5) {
    temp = 59;
  } else if (distanceTravelInKm <= 16) {
    fareKm = 14;
  } else if (distanceTravelInKm <= 20) {
    fareKm = 13;
  } else if (distanceTravelInKm <= 33) {
    fareKm = 12;
  } else if (distanceTravelInKm <= 39) {
    fareKm = 11;
  } else if (distanceTravelInKm <= 54) {
    fareKm = 10;
  } else if (distanceTravelInKm <= 60) {
    fareKm = 9;
  } else if (distanceTravelInKm <= 80) {
    fareKm = 8;
  } else if (distanceTravelInKm <= 100) {
    fareKm = 7;
  }
  if (temp == 59) {
    totalFareCalculate = 59 + (spSypDouble * 0.03);
    delivery_part_profir = 47;
    return totalFareCalculate;
  } else {
    totalFareCalculate = fareKm * distanceTravelInKm;
    int test = (totalFareCalculate * 80 / 100).ceil();
    delivery_part_profir = test.toDouble();
    if (spSypDouble == 0) {
      totalFareCalculate = totalFareCalculate;
    } else {
      totalFareCalculate += (spSypDouble * 0.03);
    }
    return totalFareCalculate;
  }
}
