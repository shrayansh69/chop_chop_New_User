import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class version extends StatefulWidget {
  @override
  State<version> createState() => _versionState();
}

class _versionState extends State<version> {
  _launchURL() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.vgtpl.cl'; // Replace with your app's Play Store URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQrtWE7j8SKBZfn8hiyLSB53OTi6fmtDHS0WbpkXP1XKzWmpbm8"),
            SizedBox(height: 30),
            Text(
              'Time To Update!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "We added lots of new features and fix some",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            Text(
              "bugs to make your experience as smooth as",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            Text(
              "possible",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                _launchURL();
              },
              child: Container(
                width: 100,
                height: 35,
                decoration: BoxDecoration(
                    color: Color(0xfff96410),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "Update",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
