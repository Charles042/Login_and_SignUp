import 'dart:convert';

//import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_and_signup/model/user_model.dart';
import 'package:login_and_signup/widgets/forms.dart';
import 'package:login_and_signup/widgets/clipper.dart';

import 'login_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //UserModel _user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
    children: <Widget> [
          Clipper(),
          Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Forms(),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => Login()));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    ));
  }
}
