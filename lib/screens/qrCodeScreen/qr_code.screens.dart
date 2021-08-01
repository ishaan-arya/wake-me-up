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
              Header(title: "Print Your QR Code"),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250.0,
                      height: 250.0,
                      child: Image.asset('images/qrcode.png'),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kSecondaryColor,

                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
                      child: Text(
                        "Print this QR Code and stick it somewhere away from your bed (probably in the bathroom) to start getting your lazy self out of bed every morning!",
                        style: kQRTextStyle,
                        textAlign: TextAlign.center,
                      ),
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


