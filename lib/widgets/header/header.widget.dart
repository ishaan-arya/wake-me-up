import 'package:flutter/material.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';

class Header extends StatelessWidget {
  String title;
  Header({this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: kContrastColor,
          ),
          SizedBox(
            width: 100,
          ),
          Text(title, style: kHeaderTextStyle),
        ],
      ),
    );
  }
}
