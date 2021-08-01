import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  SharedPreferences prefs;

  Future<void> initprefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  void setProfileData(String name, String timezone, bool nightOwl) {
    prefs.setString('UserName', name);
    prefs.setString('UserTimeZone', timezone);
    prefs.setBool('NightOwl', nightOwl);
  }

  void setAlarmData(
      {@required String alarmId,
      @required TimeOfDay alarmtime,
      @required String repeat,
      @required String alarmName,
      @required String alarmMessage,
      @required bool vibration,
      @required BuildContext context}) {
    String time = alarmtime.toString().split('(')[1].split(')')[0];
    prefs.setString('AlarmTime_' + alarmId, time);
    prefs.setString('Repeat_' + alarmId, repeat);
    prefs.setString('AlarmName_' + alarmId, alarmName);
    prefs.setString('AlarmMessage_' + alarmId, alarmMessage);
    prefs.setBool('Vibration_' + alarmId, vibration);
  }

  void deleteAlarmData(String alarmId) {
    prefs.remove('Repeat_' + alarmId);
    prefs.remove('AlarmName_' + alarmId);
    prefs.remove('AlarmMessage_' + alarmId);
    prefs.remove('Vibration_' + alarmId);
  }

  void activateAlarm(String alarmId) {
    prefs.setBool('Active_' + alarmId, true);
  }

  void deactivateAlarm(String alarmId, bool) {
    prefs.setBool('Active_' + alarmId, false);
  }

  Map<String, dynamic> getAlarmData(String alarmId) {
    String time = prefs.getString('AlarmTime' + alarmId);
    String repeat = prefs.getString('Repeat_' + alarmId);
    String alarmName = prefs.getString('AlarmName_' + alarmId);
    String alarmMessage = prefs.getString('AlarmMessage_' + alarmId);
    bool vibration = prefs.getBool('Vibration_' + alarmId);
    return {
      'alarmId': alarmId,
      'alarmTime': time,
      'repeat': repeat,
      'alarmName': alarmName,
      'alarmMessage': alarmMessage,
      'vibration': vibration,
    };
  }

  Map<String, dynamic> getProfileData() {
    String username = prefs.getString('UserName');
    String timezone = prefs.getString('UserTimeZone');
    String nightOwl = prefs.getString('NightOwl');
    return {
      'username': username,
      'timezone': timezone,
      'nightowl': nightOwl,
    };
  }
}
