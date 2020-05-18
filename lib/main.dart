import 'package:flutter/material.dart';
import 'package:login_and_signup/screens/home.dart';
import 'package:login_and_signup/utils/constants.dart';

void main() => runApp((MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Constants.lightTheme,
      home: Home(),
    );
  }
}