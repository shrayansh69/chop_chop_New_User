import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallButton extends StatelessWidget {
  final String phoneNumber;

  const CallButton({super.key, required this.phoneNumber});

  void _launchCaller() async {
    var url = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launch("tel:$phoneNumber");
      },
      child: Container(
        margin: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.05,
        ),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.04,
        decoration: BoxDecoration(
          color: const Color(0xFFECE711),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color(0xFFECE711),
            width: 2,
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.phone,
              color: Colors.black,
            ),
            SizedBox(width: 20),
            Text(
              'Call delivery partner',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
