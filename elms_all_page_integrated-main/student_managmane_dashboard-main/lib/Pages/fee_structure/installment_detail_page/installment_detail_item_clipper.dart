import 'package:flutter/material.dart';

class InstallmentDetailFirstClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    Path path = Path();
    path.lineTo(width * 0.8, 0);
    path.lineTo(width * 0.55, height * 0.5);
    path.lineTo(width * 0.80, height);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class InstallmentDetailsSecondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    Path path = Path();
    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(width * 0.3, height);
    path.lineTo(0, height * 0.5);
    path.lineTo(width * 0.3, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
