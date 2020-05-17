import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_and_signup/model/user_model.dart';
import 'package:http/http.dart' as http;

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  String _firstname;
  String _lastname;
  String _email;
  String _password;

  bool loading = false;

  Future<UserModel> createUser() async {
    FormState form = _formKey.currentState;
    form.save();
    if(form.validate()){
      setState(() {
        loading = true;
      });
      final String apiUrl = "https://simple-node-login.herokuapp.com/user/signup";
      var response = await http.post(
        apiUrl,
        body: {
          "email": _email,
          "password": _password,
          "firstname": _firstname,
          "lastname": _lastname,
        },
      ).catchError((e) {
        throw (e);
      });

      print(response.body);

      if (response.statusCode == 200) {
        showToast("User registered succesfully");
        setState(() {
          loading = false;
        });
        return userModelFromJson(response.body);
      } else {
        setState(() {
          loading = false;
        });
        showToast(jsonDecode(response.body)['message']??"Something went wrong");
        return null;
      }
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstName() {
    return Theme(
      data: ThemeData(
        primaryColor: Theme.of(context).accentColor,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'First Name',
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'First Name is Required';
          }
          return null;
        },
        onSaved: (String value){
          _firstname = value;
        },
      ),
    );
  }

  Widget _buildLastName() {
    return Theme(
      data: ThemeData(
        primaryColor: Theme.of(context).accentColor,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'Last Name'),
        validator: (String value){
          if(value.isEmpty){
            return 'Last Name is Required';
          }
          return null;

        },
        onSaved: (String value){
          _lastname = value;
        },
      ),
    );
  }

  Widget _buildEmail() {
    return Theme(
      data: ThemeData(
        primaryColor: Theme.of(context).accentColor,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'Email',),
        validator: (String value){
          if(value.isEmpty){
            return 'Input an Email';
          }
          if(!RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$").hasMatch(value)) {
            return 'Please enter a valid emaill';
          }
          return null;
        },
        onSaved: (String value){
          _email = value;
        },
      ),
    );
  }

  Widget _buildPassword() {
    return Theme(
      data: ThemeData(
        primaryColor: Theme.of(context).accentColor,
      ),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            labelText: 'Password', ),
        validator: (String value){
          if(value.isEmpty){
            return 'Password is Required';
          }
          return null;

        },
        onSaved: (String value){
          _password = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildFirstName(),
                _buildLastName(),
                _buildEmail(),
                _buildPassword(),
                SizedBox(
                  height: 20,
                ),
                loading
                    ? CircularProgressIndicator()
                    : GestureDetector(
                  onTap:  () => createUser(),
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
              ],
            ),
          ),
        )
      ],
    );
  }
}
