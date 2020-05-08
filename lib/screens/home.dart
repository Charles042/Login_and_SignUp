import 'package:flutter/material.dart';
import 'package:login_and_signup/model/user_model.dart';
import 'package:login_and_signup/widgets/clipper.dart';
import 'package:login_and_signup/widgets/input_fields.dart';
import 'package:http/http.dart' as http;

import 'login_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Future<UserModel> createUser(String email, String firstname, String lastname, String password) async{
  final String apiUrl = "https://simple-node-login.herokuapp.com/user/signup";
  
  final response = await http.post(apiUrl, body:  {
    "email":  email,
    "password": password,
    "firstname": firstname,
    "lastname": lastname
  });
  if(response.statusCode == 200) {
    final String responseString = response.body;

    return userModelFromJson(responseString);
  }else{
    return null;
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Clipper(),
              InputFields(),
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
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
