import 'package:flutter/material.dart';

//top circle clipper
class TopCircleClipper extends CustomClipper<Path> {
  double startLineWidthAnimation,
      secondLineWidthAnimation,
      secondLineheightAnimation,
      firstQDBstartWidthAnimation,
      firstQDBstartHeightAnimation,
      firstQDBendWidthAnimation,
      firstQDBendHeightAnimation,
      secondQDBstartWidthAnimation;
  TopCircleClipper({
    required this.startLineWidthAnimation,
    required this.firstQDBstartWidthAnimation,
    required this.firstQDBstartHeightAnimation,
    required this.firstQDBendWidthAnimation,
    required this.firstQDBendHeightAnimation,
    required this.secondLineWidthAnimation,
    required this.secondLineheightAnimation,
    required this.secondQDBstartWidthAnimation,
  });
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path = Path();
    path.lineTo(width * startLineWidthAnimation, 0);
    // path.lineTo(width * startLineWidthAnimation, 0);
    path.lineTo(
        width * secondLineWidthAnimation, height * secondLineheightAnimation);

    path.quadraticBezierTo(
        width * firstQDBstartWidthAnimation,
        height * firstQDBstartHeightAnimation,
        width * firstQDBendWidthAnimation,
        height * firstQDBendHeightAnimation);
    path.quadraticBezierTo(
        width * secondQDBstartWidthAnimation, height, 0, height * 0.9);
    path.lineTo(0, height * 0.3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

//bottom cicle clipper
class BottomCircleClipper extends CustomClipper<Path> {
  BottomCircleClipper({
    required this.startLineWidthAnimation,
    required this.firstQDBstartHeightAnimation,
    required this.firstQDBendWidthAnimation,
    required this.firstQDBendHeightAnimation,
    required this.secondQDBstartHeightAnimation,
    required this.secondQDBstartWidthAnimation,
    required this.secondQDBendHeightAnimation,
  });
  double startLineWidthAnimation,
      firstQDBstartHeightAnimation,
      firstQDBendWidthAnimation,
      firstQDBendHeightAnimation,
      secondQDBstartWidthAnimation,
      secondQDBstartHeightAnimation,
      secondQDBendHeightAnimation;
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0, height);
    path.lineTo(width * startLineWidthAnimation, height);
    path.quadraticBezierTo(0, height * firstQDBstartHeightAnimation,
        width * firstQDBendWidthAnimation, height * 0.22);
    path.quadraticBezierTo(
        width * secondQDBstartWidthAnimation,
        height * secondQDBstartHeightAnimation,
        width,
        height * secondQDBendHeightAnimation);
    path.lineTo(width, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

//bottom cicle clipper
class BottomCircleClipperBig extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0, height);
    path.lineTo(width * 0.08, height);
    path.quadraticBezierTo(0, height * 0.38, width * 0.32, height * 0.15);
    path.quadraticBezierTo(width * 0.58, 0, width, height * 0.1);
    path.lineTo(width, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
