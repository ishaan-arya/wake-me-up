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
        margin: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 5)
          )],
          border: Border.all(width: 1.0, color: Colors.white),
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
        child: Icon(Icons.add, color: Colors.white,),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
