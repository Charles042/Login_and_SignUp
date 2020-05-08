import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 150,
          color: Colors.blueAccent,
        ),
        Positioned(
          top: 50,
          child: Text(
            'Profile',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1),
          ),
        ),
        Positioned(
          top: 110,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/trisha.jpg'),
            radius: 40,
          ),
        ),
      ],
    );
  }
}
