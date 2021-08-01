import 'package:flutter/material.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';
import 'package:wake_me_up/widgets/header/header.widget.dart';
import 'package:slide_to_act/slide_to_act.dart';

class PostQRScanScreen extends StatelessWidget {
  var zero = DateTime.now().minute < 10 ? '0' : '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DateTime.now().hour >= 5 && DateTime.now().hour <= 17
                    ? Image.asset(
                        'images/morning_sun.png',
                        height: 200,
                        width: 200,
                      )
                    : Image.asset(
                        'images/night_moon.png',
                        height: 200,
                        width: 200,
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: DateTime.now().hour >= 5 && DateTime.now().hour <= 17
                        ? Text(
                            'Good Morning',
                            style: kMassiveTextStyle,
                          )
                        : Text(
                            'Good Evening',
                            style: kMassiveTextStyle,
                          ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "It's",
                      style: kHeaderTextStyle,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${DateTime.now().hour}:${zero}${DateTime.now().minute}',
                      style: kMassiveTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    'Alarm name',
                    //TODO: Add alarm name according to database
                    style: kHeaderTextStyle,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45),
                  child: SlideAction(
                    text: "Let's Go",
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: 'Poppins',
                    ),
                    outerColor: kDarkYellowColor,
                    innerColor: kPrimaryColor,
                    onSubmit: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
