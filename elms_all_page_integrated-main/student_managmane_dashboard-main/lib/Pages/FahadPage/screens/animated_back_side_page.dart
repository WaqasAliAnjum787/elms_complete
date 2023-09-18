import 'package:flutter/material.dart';

class AnimatedBackGround extends StatefulWidget {
  const AnimatedBackGround({super.key});

  @override
  State<AnimatedBackGround> createState() => _AnimatedBackGroundState();
}

class _AnimatedBackGroundState extends State<AnimatedBackGround>
    with SingleTickerProviderStateMixin {
  // late double x1, y1, x2, y2, x3, y3, x4, y4, x5, y5;

  late AnimationController _animatedControler;
  late final Animation<AlignmentGeometry> _animationX1Y1;
  late final Animation<AlignmentGeometry> _animationX2Y2;
  late final Animation<AlignmentGeometry> _animationX3Y3;
  late final Animation<AlignmentGeometry> _animationX4Y4;
  late final Animation<AlignmentGeometry> _animationX5Y5;
  var curved = Curves.easeInOut;

  @override
  void initState() {
    super.initState();

    // Controller
    _animatedControler = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 7),
        reverseDuration: const Duration(seconds: 7))
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _animatedControler.forward();
        } else if (status == AnimationStatus.completed) {
          _animatedControler.reverse();
        }
      });
    // Animations
    // x1
    _animationX1Y1 = Tween<AlignmentGeometry>(
            begin: const Alignment(-0.8, -0.8),
            end: const Alignment(-0.2, -0.6))
        // .animate(CurvedAnimation(parent: _animatedControler, curve: curved));
        .animate(_animatedControler);
    // // x2
    _animationX2Y2 = Tween<AlignmentGeometry>(
            begin: const Alignment(-0.5, -0.7),
            end: const Alignment(0.55, -0.3))
        // .animate(CurvedAnimation(parent: _animatedControler, curve: curved));
        .animate(_animatedControler);
    // x3
    _animationX3Y3 = Tween<AlignmentGeometry>(
            begin: const Alignment(0.55, -0.3), end: const Alignment(1.2, 0))
        .animate(CurvedAnimation(parent: _animatedControler, curve: curved));
    // .animate(_animatedControler);
    // x4
    _animationX4Y4 = Tween<AlignmentGeometry>(
            begin: const Alignment(-1.5, 0.5), end: const Alignment(-2, 0))
        .animate(CurvedAnimation(parent: _animatedControler, curve: curved));
    // .animate(_animatedControler);
    // x5
    _animationX5Y5 = Tween<AlignmentGeometry>(
            begin: const Alignment(0.75, 0.8), end: const Alignment(-0.3, 0.8))
        // .animate(CurvedAnimation(parent: _animatedControler, curve: curved));
        .animate(_animatedControler);

    // x1 = -0.8;
    // y1 = -0.8;
    // x2 = -0.5;
    // y2 = -0.7;
    // x3 = 0.55;
    // y3 = -0.3;
    // x4 = -1.5;
    // y4 = 0.5;
    // x5 = 0.7;
    // y5 = 0.8;

    _animatedControler.forward();
  }

  @override
  void dispose() {
    _animatedControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Stack(children: [
      // 1
      MovableBall(
          width: width * 0.05,
          height: height * 0.05,
          alignment: _animationX1Y1),
      // 2
      MovableBall(
          width: width * 0.15,
          height: height * 0.15,
          alignment: _animationX2Y2),
      // //  3......................
      MovableBall(
          width: width * 0.28,
          height: height * 0.28,
          alignment: _animationX3Y3),
      // //  4
      MovableBall(
          width: width * 0.55,
          height: height * 0.55,
          alignment: _animationX4Y4),
      // //  5
      MovableBall(
          width: width * 0.4, height: height * 0.4, alignment: _animationX5Y5),
    ]);
  }
}

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
