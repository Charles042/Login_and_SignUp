import 'package:flutter/material.dart';

class ProfileFields extends StatefulWidget {
  @override
  _ProfileFieldsState createState() => _ProfileFieldsState();
}

class _ProfileFieldsState extends State<ProfileFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              subtitle: Text(
                'janedoe12@gmail.com',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                'Phone Number',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              subtitle: Text(
                '+1 818 312 445 789',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                'Address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              subtitle: Text(
                '25 WEST PARK DRIVE, GREENWICH, LONDON',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
              ),
            ),
          ),
        )
      ],
    );
  }
}
