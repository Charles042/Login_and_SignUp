import 'package:flutter/material.dart';

class Clipper extends StatefulWidget {
  @override
  _ClipperState createState() => _ClipperState();
}

class _ClipperState extends State<Clipper> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomShapeClipper(),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: Center(
          child: Text(
            'Create Account',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class BottomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0, size.height * 0.70);
    Offset curveEndPoint = Offset(size.width, size.height * 0.70);
    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    path.quadraticBezierTo(
        size.width / 2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
