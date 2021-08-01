import 'package:flutter/material.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';

class LargeBottomButton extends StatelessWidget {
  final Widget child;
  LargeBottomButton({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
