import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wake_me_up/widgets/header/header.widget.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';
import 'package:wake_me_up/widgets/gradientTextInputField/gradient_text_input_field.widget.dart';
import 'package:uuid/uuid.dart';
import 'package:wake_me_up/models/databaseManagement/database_management.model.dart';

class AddAlarmScreen extends StatefulWidget {
  @override
  _AddAlarmScreenState createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {
  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();
  var uuid = Uuid();
  final _formKey = GlobalKey<FormState>();

  void initState() {
    sharedPreferencesManager.initprefs();
  }

  List<String> repeatList = [
    'Today',
    'Weekdays',
    'Daily',
    'Weekends',
  ];

  String alarmName = '';
  String alarmMessage = '';

  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  var timeUserSelected;
  var ampm;

  bool isSwitched = false;
  bool vibrate = false;

  int? slidingSegmentedControlValue = 1;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        vibrate = true;
      });
    } else {
      setState(() {
        isSwitched = false;
        vibrate = false;
      });
    }
  }

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
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
              Header(title: 'Add an Alarm', routeName: '/third',),
              SizedBox(
                height: 20,
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
                height: 20,
              ),
              Image.asset(
                _time.hour >= 5 && _time.hour <= 17
                    ? 'images/sun-removebg-preview.png'
                    : 'images/moon.png',
                height: 70,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kLightPrimaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 3.0,
                        spreadRadius: 1.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Repeat',
                              style: kSubheadingTextStyle,
                            ),
                            GradientTextInputField(
                              height: 52,
                              child: CupertinoSlidingSegmentedControl(
                                groupValue: slidingSegmentedControlValue,
                                children: {
                                  1: Text('Today',
                                      style: TextStyle(color: kContrastColor)),
                                  2: Text('Weekdays',
                                      style: TextStyle(color: kContrastColor)),
                                  3: Text('Daily',
                                      style: TextStyle(color: kContrastColor)),
                                  4: Text('Weekends',
                                      style: TextStyle(color: kContrastColor)),
                                },
                                onValueChanged: (int? value) {
                                  setState(() {
                                    slidingSegmentedControlValue = value;
                                  });
                                },
                                thumbColor: kLightPrimaryColor,
                              ),
                            ),
                            Text(
                              'Alarm Name',
                              style: kSubheadingTextStyle,
                            ),
                            GradientTextInputField(
                              height: 52,
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                onChanged: (_value) {
                                  alarmName = _value;
                                },
                                validator: (value) => value!.isEmpty
                                    ? 'Please enter an alarm name'
                                    : null,
                              ),
                            ),
                            Text(
                              'Alarm Message',
                              style: kSubheadingTextStyle,
                            ),
                            GradientTextInputField(
                              height: 52,
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                onChanged: (_value) {
                                  alarmMessage = _value;
                                },
                                validator: (value) => value!.isEmpty
                                    ? 'Please enter an alarm message'
                                    : null,
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
                                    activeColor: kSecondaryColor,
                                    activeTrackColor: Colors.grey[700],
                                    inactiveThumbColor: kSecondaryColor,
                                    inactiveTrackColor: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      'Save',
                      style: kSubheadingTextStyle,
                    ),
                  ),
                ),
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    sharedPreferencesManager.setAlarmData(
                      alarmId: uuid.v1(),
                      alarmtime: _time,
                      repeat: repeatList[slidingSegmentedControlValue! - 1],
                      alarmName: alarmName,
                      alarmMessage: alarmMessage,
                      vibration: vibrate,
                      context: context,
                    );
                    Navigator.pushNamed(context, '/third');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
