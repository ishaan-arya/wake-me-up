enum Repeat { Today, Weekdays, Daily, Weekends }

class Alarm {
  Repeat repeat;
  String name;
  String message;
  DateTime time;
  bool vibration;
}
