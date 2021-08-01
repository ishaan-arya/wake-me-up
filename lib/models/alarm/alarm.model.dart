import 'package:flutter/material.dart';

List<Alarm> alarmList = [];

class Alarm {
  String? id;
  String? repeat;
  String? name;
  String? message;
  TimeOfDay? time;
  bool? vibration;
}
