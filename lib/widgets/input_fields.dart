import 'package:flutter/material.dart';

class InputFields extends StatefulWidget {
  @override
  _InputFieldsState createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'First Name',
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 20,
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
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 20,
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
            'Phone Number',
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 20,
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
                'Confirm Password',
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
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Divider(
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
