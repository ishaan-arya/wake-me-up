import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';
import 'package:wake_me_up/widgets/designedAnalogClock/designed_analog_clock.widget.dart';
import 'package:wake_me_up/widgets/addAlarmButton/add_alarm_button.widget.dart';
import 'package:wake_me_up/widgets/largeBottomButton/large_bottom_button.widget.dart';

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
              SizedBox(height: 40),
              DesignedAnalogClock(),
              SizedBox(height: 20),
              Expanded(
                child: Container(),
              ),
              AddAlarmButton(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              LargeBottomButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 1),
                    Icon(Icons.alarm, color: kContrastColor),
                    SizedBox(width: 10),
                    Icon(Icons.supervised_user_circle, color: kContrastColor),
                    SizedBox(width: 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
