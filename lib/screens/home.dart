import 'dart:convert';

import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_and_signup/model/user_model.dart';
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


    final String responseString = response.body;
    showToast(jsonDecode(responseString)['message']);
    return  userModelFromJson(responseString);

  } else {
    showToast("The user ${firstname}Signed Up successfully");
    return null;
  }
}



  showToast(String msg) {
  Fluttertoast.showToast(
    msg: "$msg",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
  );
}

class _HomeState extends State<Home> {

  UserModel _user;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
              children: <Widget>[
                Clipper(),
                Expanded(
                    child: Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'First Name',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          height: 20,
                          child: TextField(
                            expands: true,
                            maxLines: null,
                            minLines: null,
                            controller: firstNameController,
                            decoration: InputDecoration.collapsed(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Divider(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Last Name',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          height: 20,
                          child: TextField(
                            expands: true,
                            maxLines: null,
                            minLines: null,
                            controller: lastNameController,
                            decoration: InputDecoration.collapsed(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Divider(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Email',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          height: 20,
                          child: TextField(
                            expands: true,
                            maxLines: null,
                            minLines: null,
                            controller: emailController,
                            decoration: InputDecoration.collapsed(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Divider(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Password',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {}),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          height: 20,
                          child: TextField(
                            expands: true,
                            maxLines: null,
                            minLines: null,
                            controller: passwordController,
                            decoration: InputDecoration.collapsed(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Divider(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                          height: 45,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child:  GestureDetector(
                              onTap:() async {

                                final String firstname =
                                    firstNameController.text;
                                final String lastname = lastNameController.text;
                                final String email = emailController.text;
                                final String password = passwordController.text;

                                final UserModel user = await createUser(
                                    email, firstname, lastname, password);

                                setState(() {
                                  _user = user;
                                });

                              },

                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Login()));
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
                  ),
                ))
              ],
            ),
    );
  }
}
