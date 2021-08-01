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
              Header(title: "QR Code Screen"),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250.0,
                      height: 250.0,
                      color: kSecondaryColor,
                      child: Image.asset('images/qrcode.png'),
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    Text(
                      "Print this QR Code and stick it somewhere away from your bed (probably in the bathroom) to start getting your lazy self out of bed every morning!",
                      style: kQRTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}


