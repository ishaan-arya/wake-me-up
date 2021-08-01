import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wake_me_up/models/databaseManagement/database_management.model.dart';
import 'package:wake_me_up/widgets/header/header.widget.dart';
import 'package:wake_me_up/utils/constants/constants.utils.dart';
import 'package:wake_me_up/widgets/gradientTextInputField/gradient_text_input_field.widget.dart';
import 'package:wake_me_up/widgets/largeBottomButton/large_bottom_button.widget.dart';

enum SelectedBird { lark, nightOwl }

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  String? timezone;

  SelectedBird? _character = SelectedBird.nightOwl;
  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();
  bool isOwl = true;

  void initState() {
    sharedPreferencesManager.initprefs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Header(
                  title: 'Profile',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        kSecondaryColor,
                        kLightPrimaryColor,
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: isOwl
                      ? Image.asset('images/owl.png')
                      : Image.asset('images/lark.png'),
                ),
                SizedBox(height: 40),
                Text('What should we call you?', style: kProfileItemTextStyle),
                GradientTextInputField(
                  height: 37,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('What timezone are you in?', style: kProfileItemTextStyle),
                GradientTextInputField(
                  height: 37,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      timezone = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Are you a lark or a night owl?',
                    style: kProfileItemTextStyle),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: ListTile(
                    title: Text(
                      'Lark',
                      style: kProfileItemTextStyle,
                    ),
                    leading: Radio<SelectedBird>(
                      value: SelectedBird.lark,
                      groupValue: _character,
                      onChanged: (SelectedBird? value) {
                        setState(() {
                          _character = value;
                          isOwl = false;
                        });
                      },
                      fillColor: MaterialStateProperty.all(kSecondaryColor),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: ListTile(
                    title: Text(
                      'Night Owl',
                      style: kProfileItemTextStyle,
                    ),
                    leading: Radio<SelectedBird>(
                      value: SelectedBird.nightOwl,
                      groupValue: _character,
                      onChanged: (SelectedBird? value) {
                        setState(() {
                          _character = value;
                          isOwl = true;
                        });
                      },
                      fillColor: MaterialStateProperty.all(kSecondaryColor),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: GradientTextInputField(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Grab Your QR Code',
                          style: kProfileItemTextStyle,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: kContrastColor,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/first');
                  },
                ),
                SizedBox(height: 10),
                LargeBottomButton(
                  child: Center(
                    child: Text('Save Changes', style: kProfileItemTextStyle),
                  ),
                  onTap: () {
                    sharedPreferencesManager.setProfileData(
                        name, timezone, isOwl);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
