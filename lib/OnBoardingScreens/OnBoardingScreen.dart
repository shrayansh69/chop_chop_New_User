import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cl/Constants/consts.dart';
import 'package:cl/OnBoardingScreens/IntroScreen1.dart';
import 'package:cl/OnBoardingScreens/IntroScreen2.dart';
import 'package:cl/OnBoardingScreens/IntroScreen3.dart';
import 'package:cl/Screens/HomeScreen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;

String selectedGender = 'Mr.';
String UID = "";
String UserID = "";
String contactnumb = "";
int phoneOTP = 0;
final storage = GetStorage();
List<String> genderOptions = ['Mr.', 'Mrs.', 'Miss.'];
int currentPage = 0;
PageController _controller = PageController();

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool shouldAutoScroll = true;

  @override
  void initState() {
    super.initState();

    _startAutoScroll(); // Start auto-scrolling
  }

  // Add a variable to keep track of the current page
  void _startAutoScroll() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (shouldAutoScroll && _controller.hasClients) {
        if (currentPage == 2) {
          shouldAutoScroll = false; // Stop auto-scrolling after last page
        } else {
          currentPage++;
          _controller.nextPage(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          children: const [
            first(),
            IntroScreen2(),
            IntroScreen3(),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.03,
              left: MediaQuery.of(context).size.height * 0.05),
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Material(
                      color: kButtonColor,
                      borderRadius: BorderRadius.circular(40.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const _Login(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.015,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.06,
                          ),
                          child: const Text(
                            "Log In/Sign Up",
                            style: TextStyle(
                                color: logoColor3,
                                // fontFamily: "Poppins-Regular",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                        );
                        if (currentPage == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const _Login(),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: logoColor3,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04),
                  child: Row(
                    children: [
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: const JumpingDotEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          dotColor: Colors.grey,
                          activeDotColor: Color(0xFFECE711),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

String numm = "";
String verificationId = "";
String phoneNumberC = "";

final TextEditingController phoneNumberController = TextEditingController();
final TextEditingController nameController = TextEditingController();
String nameC = "";

// login
class _Login extends StatefulWidget {
  const _Login();

  @override
  State<_Login> createState() => __LoginState();
}

String opp = "";

class __LoginState extends State<_Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isApiResultValid = false;
  String phoneNumber = "";

  OtpFieldController otpController = OtpFieldController();

  Future<void> postData() async {
    // Replace this URL with the actual API endpoint you want to POST data to.
    const String apiUrl = 'https://chopchoplogistic.com/UserValidity/api/send';

    // Replace this with the data you want to send in the request body.
    final Map<String, dynamic> data = {
      'UID': nameStorage.read('UID'),
      'Fname': nameStorage.read('nameC'),
      'Contact': nameStorage.read('Contact')
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json', // Adjust the content type as needed
      },
    );

    if (response.statusCode == 200) {
      print("submitted");
      print("Success: ${response.body}");
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      // You can process the response data here
    } else {
      print("Error: ${response.statusCode}");
      print("Response: ${response.body}");
      // Handle errors or failed responses here
    }
  }

  // Future<void> _verifyPhoneNumber() async {
  //   phoneNumber = phoneNumberController.text;
  //   numm = phoneNumber;
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: '+91$phoneNumber',
  //     // phoneNumber: '+919304837716',
  //     verificationCompleted: (PhoneAuthCredential credential) {},
  //     verificationFailed: (FirebaseAuthException e) {
  //       print("Verification failed: ${e.message}");
  //     },
  //     codeSent: (String verificationIdd, int? resendToken) {
  //       setState(() {
  //         verificationId = verificationIdd;
  //         NameConfirm = nameC;
  //       });
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('OTP Sent to $phoneNumber'),
  //         ),
  //       );
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  // Future<void> _signInWithPhoneNumber(String opt, String NameConfir) async {
  //   String otp = opt;
  //   NameConfirm = NameConfir; // Get the OTP from the user input
  //   print(otp);
  //   try {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId,
  //       smsCode: otp,
  //     );
  //     await _auth.signInWithCredential(credential);

  //     // You can now access the signed-in user
  //     User? user = _auth.currentUser;
  //     print(otp);
  //     if (user != null) {
  //       print("done");

  //       introdata.write("displayed", true);
  //       UID = user.uid;
  //
  //

  //       final response = await http.get(Uri.parse(
  //           'https://chopchoplogistic.com/validUserCustomer/api/list/$UID'));
  //       if (response.statusCode == 200) {
  //         final data = json.decode(response.body);
  //         setState(() {
  //           UserID = UID;
  //           isApiResultValid = data;
  //         });
  //       }
  //       if (isApiResultValid) {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (_) => const HomeScreen()));
  //       } else {
  // postData();
  //       }
  //       // Navigator.push(
  //       //     context, MaterialPageRoute(builder: (_) => const HomeScreen()));
  //     }
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print("Failed to sign in: $e");
  //   }
  // }

  final introdata = GetStorage();
  final nameStorage = GetStorage();

  Future<void> ExistingUser() async {
    final phoneNumber = phoneNumberController.text;
    final url =
        'https://chopchoplogistic.com/UserValidity/api/list/$phoneNumber';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData['exists']);
        String Check = responseData['exists'].toString();
        // Check if the 'exists' key is present in the response
        if ((Check == "true")) {
          String userExists = responseData['UID'];

          nameC = nameController.text;
          nameStorage.write('nameC', nameC);
          nameStorage.write('uid', userExists);
          nameStorage.write('Contact', phoneNumber);
          nameStorage.write('UID', userExists);
          nameStorage.write('Logged', true);

          //       nameStorage.write('Contact', numm);
          print("name" + nameStorage.read('nameC'));
          print(nameStorage.read('uid'));
          print(nameStorage.read('Contact'));
          String? storedNameC = nameStorage.read('nameC');

          storedUID = nameStorage.read('uid');

          // phoneNumber = nameStorage.read('Contact');
          print(storedUID);
          print(nameC);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomeScreen()));
        } else {
          String alphanumericCode = String.fromCharCodes(List.generate(15,
              (index) => (index.isEven ? 65 : 97) + (Random().nextInt(26))));
          print(alphanumericCode);

          String userExists = alphanumericCode;
          print(userExists);
          nameC = nameController.text;
          nameStorage.write('nameC', nameC);
          nameStorage.write('uid', userExists);
          nameStorage.write('Contact', phoneNumber);
          nameStorage.write('UID', userExists);
          // nameStorage.write('Logged', true);

          UID = nameStorage.read('UID');
          print(UID);
          print(nameC);
          print(nameStorage.read('nameC'));
          postData();
        }
      } else {
        // Handle error
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Exception: $e');
    }
  }

  Future<void> fetchData() async {
    phoneOTP = 100000 + Random().nextInt(900000);
    final phoneNumber = phoneNumberController.text;
    print(phoneNumberController.text);
    final url =
        'https://chopchoplogistic.com/smsgateway.php/?phone_number=$phoneNumber&otp=$phoneOTP';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Successful request, handle the response
        print('Response data: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('OTP Sent to $phoneNumber'),
          ),
        );
      } else {
        // Handle error
        print('Error: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to send OTP!'),
          ),
        );
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      print('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    introdata.write("displayed", true);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 47,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Text(
                "Continue With Phone",
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.009,
              ),
              const Text(
                "We will send One Time Password",
                style: TextStyle(
                    // letterSpacing: 1.0,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              const Text(
                "on this phone number.",
                style: TextStyle(
                    // letterSpacing: 1.0,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              const Text(
                'Enter Your Name',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 114, 114, 114),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(
                                width: 2.0, color: const Color(0xFFFFC700))),
                        child: DropdownButton<String>(
                          value: selectedGender,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedGender = newValue!;
                              storeSelectedGender(selectedGender);
                            });
                          },
                          underline:
                              const SizedBox(), // Add this line to remove the underline
                          items: genderOptions
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            );
                          }).toList(),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        validator: (value) {
                          // Add validator function
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Please enter your name',
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
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
              const Text(
                'Enter Your Phone Number',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 114, 114, 114),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    hintText: 'Please enter your phone number',
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
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFFFC700),
                    backgroundColor: Colors.transparent,
                    elevation: 0, // Text color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      // ignore: prefer_const_constructors
                      side: BorderSide(
                        color: const Color(0xFFFFC700), // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                  ),
                  onPressed: () async {
                    print(phoneNumberController);
                    fetchData();
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AutoSizeText(
                        'Get Otp',
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                        minFontSize: 12,
                        maxFontSize: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              const Text(
                "Enter Authentication Code",
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.009,
              ),
              const Text(
                "Enter the 6-digit Code",
                style: TextStyle(
                    // letterSpacing: 1.0,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05),
                child: OTPTextField(
                    controller: otpController,
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    // textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 50,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 10,
                    style: const TextStyle(fontSize: 17),
                    onChanged: (pin) {
                      print("Changed: $pin");
                    },
                    onCompleted: (pin) {
                      print("Completed: $pin");
                      opp = pin;
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
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
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  onPressed: () {
                    // ignore: unrelated_type_equality_checks
                    print(opp);
                    String te = phoneOTP.toString();
                    // te = "503493";
                    if (opp == te) {
                      print("Successful");
                      ExistingUser();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Incorrect Otp. Try again.'),
                        ),
                      );
                    }
                    // print(opp);
                    // nameC = nameController.text;
                    // nameStorage.write('nameC', nameC);
                    // nameStorage.write('uid', UID);
                    // nameStorage.write('Contact', UID);

                    // print(nameC);
                    // String? storedNameC = nameStorage.read('nameC');
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Proceed',
                        style: TextStyle(
                          fontSize: 17,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: const Text(
                      "Don't Receive Code?",
                      style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      String phoneNumber = phoneNumberController.text;
                      print(phoneNumber);
                      // _verifyPhoneNumber();
                    },
                    child: const Text(
                      "Resend Now",
                      style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFFC700)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              )
            ],
          ),
        ),
      ),
    ));
  }

  void storeSelectedGender(String selectedGender) {}
}
