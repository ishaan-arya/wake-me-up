import 'package:flutter/material.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';

class GradientTextInputField extends StatelessWidget {
  final Widget textField;
  GradientTextInputField({this.textField});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 52,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              kSecondaryColor,
              kLightPrimaryColor,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: textField,
        ),
      ),
    );
  }
}
