import 'package:flutter/material.dart';
import 'package:wake_me_up/widgets/header/header.widget.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';
import 'package:wake_me_up/screens/qrCodeScreen/qr_code.screens.dart';
import 'package:wake_me_up/screens/addAlarmScreen/add_alarm.screens.dart';

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
      },
      initialRoute: '/',
    );
  }
}
