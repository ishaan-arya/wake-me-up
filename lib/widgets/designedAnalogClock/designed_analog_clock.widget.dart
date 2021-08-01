import 'package:flutter/material.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';
import 'package:analog_clock/analog_clock.dart';

class DesignedAnalogClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 175,
      child: AnalogClock(
        showNumbers: false,
        showTicks: false,
        showDigitalClock: false,
        minuteHandColor: kSecondaryColor,
        hourHandColor: kSecondaryColor,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: kContrastColor),
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              kLightPrimaryColor,
              kPrimaryColor,
            ],
          ),
        ),
      ),
    );
  }
}
