import 'package:cl/Screens/Drawers/Help_.dart';
import 'package:cl/Screens/Drawers/Order_History/Delivering/DeliveringHistory.dart';
import 'package:cl/Screens/Drawers/Order_History/Pending/PendingHistory.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class NotoficationsServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings _androidInitializationSettings =
      AndroidInitializationSettings('logo');

  void initialiseNotification(BuildContext context) async {
    final InitializationSettings initializationSettings =
        InitializationSettings(android: _androidInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        _handleNotificationTap(notificationResponse, context);
      },
    );
    print('Initialization Complete');
  }

  void sendNotification(String header, String template) async {
    print('Pressed button to Send Notification');
    AndroidNotificationDetails _androidNotificationDetails =
        AndroidNotificationDetails(
      'channelID',
      'channelName',
      playSound: true,
      priority: Priority.max,
      importance: Importance.max,
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: _androidNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
      0,
      header,
      template,
      notificationDetails,
    );
  }

  void _handleNotificationTap(
      NotificationResponse notificationResponse, BuildContext context) {
    String? payload = notificationResponse.payload;
    if (payload != null) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DeliveringHistory()),
      );
    }
  }
}
