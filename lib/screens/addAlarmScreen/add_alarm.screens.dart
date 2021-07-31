import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wake_me_up/widgets/header/header.widget.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';

class AddAlarmScreen extends StatefulWidget {
  @override
  _AddAlarmScreenState createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {
  @override
  Widget build(BuildContext context) {
    TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

    void _selectTime() async {
      final TimeOfDay newTime = await showTimePicker(
        context: context,
        initialTime: _time,
      );
      if (newTime != null) {
        setState(() {
          _time = newTime;
        });
      }
    }

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Column(
            children: [
              Header(title: 'Add an Alarm'),
              SizedBox(
                height: 50,
              ),
              Text(
                '${_time.format(context)}',
                style: kTimeTextStyle,
              ),
              ElevatedButton(
                onPressed: _selectTime,
                child: Text(
                  'SELECT TIME',
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kSecondaryColor),
                  elevation: MaterialStateProperty.all(20.0),
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
