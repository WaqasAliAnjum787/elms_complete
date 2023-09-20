import 'package:flutter/cupertino.dart';

class MovableBall extends StatelessWidget {
  const MovableBall(
      {required this.alignment,
      required this.width,
      required this.height,
      super.key});

  final Animation<AlignmentGeometry> alignment;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AlignTransition(
      alignment: alignment,
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 243, 124, 138),
              Color.fromARGB(255, 202, 149, 255),
              Color.fromARGB(255, 162, 135, 234),
            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, 2),
                  color: Color.fromARGB(255, 162, 135, 234),
                  spreadRadius: 1,
                  blurRadius: 4)
            ]),
      ),
    );
  }
}
