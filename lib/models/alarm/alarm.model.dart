enum Repeat { Today, Weekdays, Daily, Weekends }

List<Alarm> alarmList = [];

class Alarm {
  Repeat? repeat;
  String? name;
  String? message;
  DateTime? time;
  bool? vibration;
}
