import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wake_me_up/widgets/header/header.widget.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';
import 'package:wake_me_up/widgets/gradientTextInputField/gradient_text_input_field.widget.dart';

class MainAlarmsScreen extends StatelessWidget {
  var zero = DateTime.now().minute < 10 ? '0' : '';
  List daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  List months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Column(
            children: [
              SizedBox(height: 40),
              Center(
                child: Text(
                  '${DateTime.now().hour}:${zero}${DateTime.now().minute}',
                  style: kTimeTextStyle,
                ),
              ),
              Text(
                '${daysOfWeek[DateTime.now().weekday - 1]}, ${DateTime.now().day} ${months[DateTime.now().month - 1]}',
                style: kProfileItemTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
