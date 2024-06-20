import 'package:auto_size_text/auto_size_text.dart';
import 'package:cl/Constants/CallButton.dart';
import 'package:cl/Screens/Drawers/Order_History/Delivering/DeliveringHistory.dart';
import 'package:flutter/material.dart';

class Delivering_ extends StatefulWidget {
  final String? orderId;
  final String? Sender_name;
  final String? Sender_phonenumber;
  final String? Sender_address;
  final String? Parcelvalue;
  final String? Parcelweight;
  final String? Parcelcateg;
  final String? Receiver_name;
  final String? Receiver_phonenumber;
  final String? Receiver_address;
  final String? Partner_name;
  final String? Partner_phonenumber;
  final String? Est_time;
  final String? Total_price;
  final String? Dist;
  final String? Payment_mode;
  final String? Status;
  final String? S_OTP;
  final String? R_OTP;

  const Delivering_({
    super.key,
    Key? Key,
    this.orderId,
    this.Sender_name,
    this.Sender_phonenumber,
    this.Sender_address,
    this.Parcelvalue,
    this.Parcelweight,
    this.Parcelcateg,
    this.Receiver_name,
    this.Receiver_phonenumber,
    this.Receiver_address,
    this.Partner_name,
    this.Partner_phonenumber,
    this.Est_time,
    this.Total_price,
    this.Dist,
    this.Payment_mode,
    this.Status,
    this.S_OTP,
    this.R_OTP,
  });

  @override
  State<Delivering_> createState() => _Delivering_State();
}

class _Delivering_State extends State<Delivering_> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DeliveringHistory()),
              );
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'On the way...',
                      style:
                          TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.007,
                      ),
                      child: SizedBox(
                          height: 80,
                          width: 80,
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.12,
                              child: Image.asset(
                                  'assets/SendPackage/muuve-rider.gif'))),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                const Text(
                  'Order ID:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Text(
                  '${(widget.orderId)?.substring(0, 5)}',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF989494)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.02),
                  width: MediaQuery.of(context).size.width *
                      0.9, // Set the desired width
                  height: MediaQuery.of(context).size.height *
                      0.3, // Set the desired height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        12), // Set the desired border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.3), // Set the shadow color
                        spreadRadius: 2, // Set how far the shadow spreads
                        blurRadius: 11, // Set the amount of blur
                        offset: const Offset(0, 4), // Set the offset
                      ),
                    ],
                    color: Colors.white, // Set the background color
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sending From",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      const Divider(
                        color: Colors.grey, // You can set the color of the line
                        thickness: 1, // You can set an indent from the right
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Name: ',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight
                                    .w500, // Change the font weight for hard-coded text
                                color: Colors
                                    .black, // Change the color for hard-coded text
                              ),
                            ),
                            TextSpan(
                              text: '${widget.Sender_name}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight
                                    .w400, // Keep the font weight for dynamic text
                                color: Color(
                                    0xFF929292), // Keep the color for dynamic text
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.007,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Mobile Number: ',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight
                                    .w500, // Change the font weight for hard-coded text
                                color: Colors
                                    .black, // Change the color for hard-coded text
                              ),
                            ),
                            TextSpan(
                              text: '${widget.Sender_phonenumber}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight
                                    .w400, // Keep the font weight for dynamic text
                                color: Color(
                                    0xFF929292), // Keep the color for dynamic text
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.007,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Address: ',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight
                                    .w500, // Change the font weight for hard-coded text
                                color: Colors
                                    .black, // Change the color for hard-coded text
                              ),
                            ),
                            TextSpan(
                              text: '${widget.Sender_address}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight
                                    .w400, // Keep the font weight for dynamic text
                                color: Color(
                                    0xFF929292), // Keep the color for dynamic text
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.007,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Weight: ',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight
                                    .w500, // Change the font weight for hard-coded text
                                color: Colors
                                    .black, // Change the color for hard-coded text
                              ),
                            ),
                            TextSpan(
                              text: '${widget.Parcelweight}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight
                                    .w400, // Keep the font weight for dynamic text
                                color: Color(
                                    0xFF929292), // Keep the color for dynamic text
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.007,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Parcel Category: ',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight
                                    .w500, // Change the font weight for hard-coded text
                                color: Colors
                                    .black, // Change the color for hard-coded text
                              ),
                            ),
                            TextSpan(
                              text: '${widget.Parcelcateg}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight
                                    .w400, // Keep the font weight for dynamic text
                                color: Color(
                                    0xFF929292), // Keep the color for dynamic text
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.02),
                  width: MediaQuery.of(context).size.width *
                      0.9, // Set the desired width
                  height: MediaQuery.of(context).size.height *
                      0.27, // Set the desired height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        12), // Set the desired border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.3), // Set the shadow color
                        spreadRadius: 2, // Set how far the shadow spreads
                        blurRadius: 11, // Set the amount of blur
                        offset: const Offset(0, 4), // Set the offset
                      ),
                    ],
                    color: Colors.white, // Set the background color
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sending To",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      const Divider(
                        color: Colors.grey, // You can set the color of the line
                        thickness: 1, // You can set an indent from the right
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Name: ',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight
                                    .w500, // Change the font weight for hard-coded text
                                color: Colors
                                    .black, // Change the color for hard-coded text
                              ),
                            ),
                            TextSpan(
                              text: '${widget.Receiver_name}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight
                                    .w400, // Keep the font weight for dynamic text
                                color: Color(
                                    0xFF929292), // Keep the color for dynamic text
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.007,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Mobile Number: ',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight
                                    .w500, // Change the font weight for hard-coded text
                                color: Colors
                                    .black, // Change the color for hard-coded text
                              ),
                            ),
                            TextSpan(
                              text: '${widget.Receiver_phonenumber}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight
                                    .w400, // Keep the font weight for dynamic text
                                color: Color(
                                    0xFF929292), // Keep the color for dynamic text
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.007,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Address: ',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight
                                    .w500, // Change the font weight for hard-coded text
                                color: Colors
                                    .black, // Change the color for hard-coded text
                              ),
                            ),
                            TextSpan(
                              text: '${widget.Receiver_address}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight
                                    .w400, // Keep the font weight for dynamic text
                                color: Color(
                                    0xFF929292), // Keep the color for dynamic text
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.02),
                  width: MediaQuery.of(context).size.width *
                      0.9, // Set the desired width
                  height: MediaQuery.of(context).size.height *
                      0.28, // Set the desired height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        12), // Set the desired border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.3), // Set the shadow color
                        spreadRadius: 2, // Set how far the shadow spreads
                        blurRadius: 11, // Set the amount of blur
                        offset: const Offset(0, 4), // Set the offset
                      ),
                    ],
                    color: Colors.white, // Set the background color
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Delivery Partner Details",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      const Divider(
                        color: Colors.grey, // You can set the color of the line
                        thickness: 1, // You can set an indent from the right
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Name: ',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight
                                    .w500, // Change the font weight for hard-coded text
                                color: Colors
                                    .black, // Change the color for hard-coded text
                              ),
                            ),
                            TextSpan(
                              text: '${widget.Partner_name}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight
                                    .w400, // Keep the font weight for dynamic text
                                color: Color(
                                    0xFF929292), // Keep the color for dynamic text
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.007,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Mobile Number: ',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight
                                    .w500, // Change the font weight for hard-coded text
                                color: Colors
                                    .black, // Change the color for hard-coded text
                              ),
                            ),
                            TextSpan(
                              text: '${widget.Partner_phonenumber}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight
                                    .w400, // Keep the font weight for dynamic text
                                color: Color(
                                    0xFF929292), // Keep the color for dynamic text
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      CallButton(
                        phoneNumber:
                            '${widget.Partner_phonenumber}', // Replace with the desired phone number
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                //Sender OTP
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.02),
                  width: MediaQuery.of(context).size.width *
                      0.9, // Set the desired width
                  height: MediaQuery.of(context).size.height *
                      0.45, // Set the desired height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        12), // Set the desired border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.3), // Set the shadow color
                        spreadRadius: 2, // Set how far the shadow spreads
                        blurRadius: 11, // Set the amount of blur
                        offset: const Offset(0, 4), // Set the offset
                      ),
                    ],
                    color: Colors.white, // Set the background color
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sender OTP:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "*Share this OTP exclusively with ${widget.Partner_name} for order pickup.",
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                        const Text(
                          "i.e With Delivery partner.",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                        const Divider(
                          color:
                              Colors.grey, // You can set the color of the line
                          thickness: 1, // You can set an indent from the right
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        AutoSizeText(
                          '${widget.S_OTP}',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            letterSpacing: 3.0,
                          ),
                          minFontSize: 12, // Set the minimum font size
                          maxFontSize: 32, // Set the maximum font size
                          maxLines:
                              1, // Set the maximum number of lines (optional)
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        const Text(
                          "Reciever OTP:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "*Kindly provide this OTP to ${widget.Receiver_name} for order acceptance.",
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                        const Text(
                          "i.e With Reciever.",
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                        const Divider(
                          color:
                              Colors.grey, // You can set the color of the line
                          thickness: 1, // You can set an indent from the right
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          '${widget.R_OTP}',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                            letterSpacing: 3.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Text(
                  "Order Details",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.02),
                  width: MediaQuery.of(context).size.width *
                      0.9, // Set the desired width
                  height: MediaQuery.of(context).size.height *
                      0.17, // Set the desired height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        12), // Set the desired border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.3), // Set the shadow color
                        spreadRadius: 2, // Set how far the shadow spreads
                        blurRadius: 11, // Set the amount of blur
                        offset: const Offset(0, 4), // Set the offset
                      ),
                    ],
                    color: Colors.white, // Set the background color
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.Status == 'A' ? 'Delivering' : 'Delivering',
                            style: widget.Status == 'P'
                                ? const TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 5, 85, 183),
                                    height: 22 / 18,
                                  )
                                : const TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 5, 85, 183),
                                    height: 22 / 18,
                                  ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Icon(
                            Icons.donut_large_outlined,
                            color: widget.Status == 'P'
                                ? const Color.fromARGB(255, 5, 85, 183)
                                : const Color.fromARGB(255, 5, 85, 183),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Total: ',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight
                                    .w500, // Change the font weight for hard-coded text
                                color: Colors
                                    .black, // Change the color for hard-coded text
                              ),
                            ),
                            TextSpan(
                              text: '${widget.Total_price}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight
                                    .w400, // Keep the font weight for dynamic text
                                color: Color.fromARGB(255, 5, 85,
                                    183), // Keep the color for dynamic text
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.007,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Payment Mode: ',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight
                                    .w500, // Change the font weight for hard-coded text
                                color: Colors
                                    .black, // Change the color for hard-coded text
                              ),
                            ),
                            TextSpan(
                              text: '${widget.Payment_mode}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight
                                    .w400, // Keep the font weight for dynamic text
                                color: Color.fromARGB(255, 5, 85,
                                    183), // Keep the color for dynamic text
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
