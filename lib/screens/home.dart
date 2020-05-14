import 'dart:convert';

//import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_and_signup/model/user_model.dart';
import 'package:login_and_signup/widgets/forms.dart';
import 'package:login_and_signup/widgets/clipper.dart';
import 'package:http/http.dart' as http;

import 'login_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

bool loading = true;

Future<UserModel> createUser(
    String email, String firstname, String lastname, String password) async {
  final String apiUrl = "https://simple-node-login.herokuapp.com/user/signup";
  var response = await http.post(
    apiUrl,
    body: {
      "email": email,
      "password": password,
      "firstname": firstname,
      "lastname": lastname
    },
  ).catchError((e) {
    throw (e);
  });

  print(response.body);

  if (response.statusCode == 200) {
    showToast(jsonDecode(response.body)['message']);
    return userModelFromJson(response.body);
  } else {
    showToast(jsonDecode(response.body)['message']??"Something went wrong");
    return null;
  }
}

showToast(String msg) {
  Fluttertoast.showToast(
    msg: "$msg",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
  );
}

class _HomeState extends State<Home> {
  //UserModel _user;

  @override
  void initState() {
    loading = true;
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
