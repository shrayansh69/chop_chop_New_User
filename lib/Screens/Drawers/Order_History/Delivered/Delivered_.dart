import 'package:cl/Screens/Drawers/Order_History/Delivering/DeliveringHistory.dart';
import 'package:flutter/material.dart';

class Delivered_ extends StatefulWidget {
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

  const Delivered_({
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
  });

  @override
  State<Delivered_> createState() => _Delivered_State();
}

class _Delivered_State extends State<Delivered_> {
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
                      'Delivered',
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
                              child:
                                  Image.asset('assets/SendPackage/7efs.gif'))),
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
                  '${(widget.orderId)!.substring(0, 5)}',
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
                      0.25, // Set the desired height
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
                      0.15, // Set the desired height
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
                            widget.Status == 'D' ? 'Delivered' : 'Delivered',
                            style: widget.Status == 'P'
                                ? const TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green,
                                    height: 22 / 18,
                                  )
                                : const TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green,
                                    height: 22 / 18,
                                  ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                          ),
                          const Icon(Icons.donut_large_outlined,
                              color: Colors.green),
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
                                color: Colors
                                    .green, // Keep the color for dynamic text
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
                                  color: Colors
                                      .green // Keep the color for dynamic text
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
