import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wake_me_up/models/databaseManagement/database_management.model.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';
import 'package:wake_me_up/widgets/designedAnalogClock/designed_analog_clock.widget.dart';
import 'package:wake_me_up/widgets/addAlarmButton/add_alarm_button.widget.dart';
import 'package:wake_me_up/widgets/largeBottomButton/large_bottom_button.widget.dart';

class MainAlarmsScreen extends StatefulWidget {
  @override
  _MainAlarmsScreenState createState() => _MainAlarmsScreenState();
}

class _MainAlarmsScreenState extends State<MainAlarmsScreen> {
  List<String>? alarms;
  SharedPreferencesManager sharedprefs = SharedPreferencesManager();
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

  void initAlarms() async {
    await sharedprefs.initprefs();
    setState(() {
      alarms = sharedprefs.getAlarms();
      alarms = ['eeee', 'oooo'];
    });
  }

  Widget alarmTile(Map alarmData, String alarmId) {
    String? repeat = alarmData['repeat'];
    String? alarmTime = alarmData['alarmTime'];
    bool activeState = alarmData['activeState'];
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xFF444974)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  repeat ?? 'Today',
                  style: kSubheadingTextStyle,
                ),
                Switch(
                  thumbColor: MaterialStateProperty.all(kPrimaryColor),
                  inactiveTrackColor: Colors.blue.shade300,
                    value: activeState,
                    onChanged: (val) {
                      val
                          ? sharedprefs.activateAlarm(alarmId)
                          : sharedprefs.deactivateAlarm(alarmId);
                      setState(() {});
                    }),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(alarmTime ?? '12:00', style: kProfileItemTextStyle),
                IconButton(
                    onPressed: () {
                      sharedprefs.deleteAlarmData(alarmId);
                      setState(() {});
                    },
                    icon: Icon(Icons.delete,
                        color: Colors.red.shade700.withOpacity(0.9)))
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    initAlarms();
    super.initState();
  }

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
              SizedBox(height: 20),
              Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    child: alarms != null
                        ? ListView.builder(
                            itemCount: alarms?.length,
                            itemBuilder: (context, index) {
                              String alarmId = alarms![index];
                              //Map alarmData = sharedprefs.getAlarmData(alarmId);
                              Map alarmData = {
                                'repeat': 'Daily',
                                'alarmTime': '8:00 AM',
                                'activeState': true,
                              };
                              return alarmTile(alarmData, alarmId);
                            },
                          )
                        : Container(
                            child: Text(
                            'Please Schedule an Alarm',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ))),
              ),
              Stack(
                children: [
                  Positioned(
                    top: 20,
                    child: LargeBottomButton(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 1),
                          Icon(Icons.alarm, color: kContrastColor),
                          SizedBox(width: 10),
                          Icon(Icons.supervised_user_circle,
                              color: kContrastColor),
                          SizedBox(width: 1),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: AddAlarmButton(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
