import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/services.dart';
import 'package:login_and_signup/model/user_model.dart';
import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email;
  String _password;

  bool loading = false;

  Future<UserModel> loginUser() async {
    FormState form = _loginKey.currentState;
    form.save();
    if (form.validate()) {
      setState(() {
        loading = true;
      });
      final String url = "https://simple-node-login.herokuapp.com/user/signup";
      var response = await http.post(
        url,
        body: {
          "email": _email,
          "password": _password,
        },
      ).catchError((e) {
        throw (e);
      });
      print(response.body);

      if (response.statusCode == 200) {
        showToast("Login succesful");
        setState(() {
          loading = false;
        });
        return userModelFromJson(response.body);
      } else {
        setState(() {
          loading = false;
        });
        showToast(
            jsonDecode(response.body)['message'] ?? "Something went wrong");
        return null;
      }
    }
  }

  showToast(String msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
    );
  }

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  Widget _buildphoneNumber() {
    return Theme(
      data: ThemeData(primaryColor: Theme.of(context).accentColor),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Email',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Email is Required';
          }
          if (!RegExp(
                  r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
              .hasMatch(value)) {
            return 'Please enter a valid emaill';
          }
          return null;
        },
        onSaved: (String value) {
          _email = value;
        },
      ),
    );
  }

  Widget _buildpassWord() {
    return Theme(
      data: ThemeData(
        primaryColor: Theme.of(context).accentColor
      ),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          labelText: 'Password',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password is Required';
          }
          return null;
        },
        onSaved: (String value) {
          _password = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: _loginKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildphoneNumber(),
            _buildpassWord(),
            SizedBox(
              height: 20,
            ),
            loading ? CircularProgressIndicator() :
            Container(
              height: 40,
              width: 140,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.blueAccent,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                onPressed: () => loginUser()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
