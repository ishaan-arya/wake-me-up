import 'package:flutter/material.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';

class LargeBottomButton extends StatelessWidget {
  final Widget child;
  LargeBottomButton({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
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
