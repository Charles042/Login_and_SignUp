import 'package:flutter/material.dart';
import 'package:login_and_signup/widgets/circle_avatar.dart';
import 'package:login_and_signup/widgets/profile_fields.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Avatar(),
          SizedBox(height: 25),
          ListTile(
            title: Center(
                child: Text(
              'Trisha Royce',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            )),
            subtitle: Center(
                child: Text(
              'Porto Novo',
              style: TextStyle(fontWeight: FontWeight.w300),
            )),
          ),
          ProfileFields(),
        ],
      ),
    );
  }
}
