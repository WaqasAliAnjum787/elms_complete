import 'package:flutter/material.dart';

class ClipWorkShopContainer extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path = Path();
    path.moveTo(width * 0.4, height * 0);
    // path.quadraticBezierTo(width * 1, height * 0.15, width, height * 0.5);
    path.cubicTo(
        width * 0.7, height * 0, width * 1, height * 0.15, width, height * 0.5);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
