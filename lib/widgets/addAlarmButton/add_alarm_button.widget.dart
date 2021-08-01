import 'package:flutter/material.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';

class AddAlarmButton extends StatelessWidget {
  final Function onTap;
  AddAlarmButton({required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(width: 1.0),
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              kSecondaryColor,
              kLightPrimaryColor,
            ],
          ),
        ),
        child: Icon(Icons.add),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
