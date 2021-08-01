import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';

class Header extends StatelessWidget {
  String title;
  Header({required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        AppBar(
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: kContrastColor,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            title,
            style: kHeaderTextStyle,
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
      ],
    );
  }
}
