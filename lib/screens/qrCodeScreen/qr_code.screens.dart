import 'package:flutter/material.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';
import 'package:wake_me_up/widgets/header/header.widget.dart';

class QRCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Column(
            children: [
              Header(title: 'QR Code Screen'),
              Container(
                width: 100.0,
                height: 100.0,
                color: kSecondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
