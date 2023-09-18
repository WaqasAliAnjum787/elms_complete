import 'package:flutter/material.dart';

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(width * 0.70, 0);
    path.lineTo(width, height * 0.5);
    path.lineTo(width * 0.70, height);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
