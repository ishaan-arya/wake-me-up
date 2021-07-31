import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wake_me_up/widgets/header/header.widget.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';
import 'package:wake_me_up/widgets/gradientTextInputField/gradient_text_input_field.widget.dart';

class AddAlarmScreen extends StatefulWidget {
  @override
  _AddAlarmScreenState createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {
  String alarmName;
  String alarmMessage;

  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  var timeUserSelected;
  var ampm;

  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
        var timeSelected = _time.format(context).toString();
        List list = timeSelected.split(' ');
        timeUserSelected = list[0];
        ampm = list[1];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Column(
            children: [
              Header(title: 'Add an Alarm'),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Text(
                    timeUserSelected ?? '7:15',
                    style: kTimeTextStyle,
                  ),
                  Text(
                    ampm ?? 'AM',
                    style: kHeaderTextStyle,
                  ),
                ],
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
              SizedBox(
                height: 60,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kLightPrimaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Repeat',
                          style: kSubheadingTextStyle,
                        ),
                        GradientTextInputField(),
                        Text(
                          'Alarm Name',
                          style: kSubheadingTextStyle,
                        ),
                        GradientTextInputField(
                          textField: TextField(
                            onChanged: (_value) {
                              alarmName = _value;
                            },
                          ),
                        ),
                        Text(
                          'Alarm Message',
                          style: kSubheadingTextStyle,
                        ),
                        GradientTextInputField(
                          textField: TextField(
                            onChanged: (_value) {
                              alarmMessage = _value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Vibration',
                              style: kSubheadingTextStyle,
                            ),
                            Transform.scale(
                              scale: 1.5,
                              child: Switch(
                                onChanged: toggleSwitch,
                                value: isSwitched,
                                activeColor: Colors.grey[700],
                                activeTrackColor: kSecondaryColor,
                                inactiveThumbColor: kSecondaryColor,
                                inactiveTrackColor: Colors.grey[700],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
