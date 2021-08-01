import 'package:flutter/material.dart';
import 'package:wake_me_up/screens/qrCodeScreen/qr_code.screens.dart';
import 'package:wake_me_up/screens/addAlarmScreen/add_alarm.screens.dart';
import 'package:wake_me_up/screens/profileScreen/profile.screen.dart';
import 'package:wake_me_up/screens/mainAlarmsScreen/main_alarms.screen.dart';
import 'package:wake_me_up/screens/postQRScanScreen/post_qr_scan.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => AddAlarmScreen(),
        '/first': (context) => QRCodeScreen(),
        '/second': (context) => ProfileScreen(),
        '/third': (context) => MainAlarmsScreen(),
        '/fourth': (context) => PostQRScanScreen(),
      },
      initialRoute: '/fourth',
    );
  }
}
