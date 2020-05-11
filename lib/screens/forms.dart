import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _firstname;
  String _lastname;
  String _email;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstName() {
    return TextFormField(
      maxLength: 15,
      decoration: InputDecoration(
          labelText: 'First Name', labelStyle: TextStyle(fontSize: 16)),
      validator: (String value){
        if(value.isEmpty){
          return 'First Name is Required';
        }
        return null;
      },
      onSaved: (String value){
        _firstname = value;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      maxLength: 15,
      decoration: InputDecoration(
          labelText: 'Last Name', labelStyle: TextStyle(fontSize: 16)),
      validator: (String value){
        if(value.isEmpty){
          return 'Last Name is Required';
        }
        return null;

      },
      onSaved: (String value){
        _lastname = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email', labelStyle: TextStyle(fontSize: 16)),
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
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          labelText: 'Password', labelStyle: TextStyle(fontSize: 16)),
      validator: (String value){
        if(value.isEmpty){
          return 'Password is Required';
        }
        return null;

      },
      onSaved: (String value){
        _password = value;
      },
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
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 45,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          if(!_formKey.currentState.validate()){
                            return ;
                          }
                          _formKey.currentState.save();
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
              ],
            ),
          ),
        )
      ],
    );
  }
}
