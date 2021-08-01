import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:wake_me_up/screens/QRScanScreen/qr_scan_screen.screen.dart';
import 'package:wake_me_up/screens/qrCodeScreen/qr_code.screens.dart';
import 'package:wake_me_up/screens/addAlarmScreen/add_alarm.screens.dart';
import 'package:wake_me_up/screens/profileScreen/profile.screen.dart';
import 'package:wake_me_up/screens/mainAlarmsScreen/main_alarms.screen.dart';
import 'package:wake_me_up/screens/postQRScanScreen/post_qr_scan.screen.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() {
  tz.initializeTimeZones();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String route = '/third';
  String? payload;

  Future<void> onSelectNotification(String? notifpayload) async {
    if (payload != null) {
      payload = notifpayload.toString();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => QRScanScreen(payload: payload.toString())));
    }
  }

  void initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('wake_me_up');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  @override
  void initState() {
    // TODO: implement initState
    initializeNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => AddAlarmScreen(),
        '/first': (context) => QRCodeScreen(),
        '/second': (context) => ProfileScreen(),
        '/third': (context) => MainAlarmsScreen(),
        // '/fourth': (context) => PostQRScanScreen(),
      },
      initialRoute: route,
    );
  }
}
