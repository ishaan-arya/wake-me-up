import 'package:flutter/material.dart';

enum Repeat { Today, Weekdays, Daily, Weekends }

List<Alarm> alarmList = [];

class Alarm {
  String? id;
  Repeat? repeat;
  String? name;
  String? message;
  TimeOfDay? time;
  bool? vibration;
}
