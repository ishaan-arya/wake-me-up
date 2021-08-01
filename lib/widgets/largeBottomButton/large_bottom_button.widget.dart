import 'package:flutter/material.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';

class LargeBottomButton extends StatelessWidget {
  final Widget child;
  final Function onTap;
  LargeBottomButton({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              kLightPrimaryColor,
              kPrimaryColor,
            ],
          ),
        ),
        child: child,
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
