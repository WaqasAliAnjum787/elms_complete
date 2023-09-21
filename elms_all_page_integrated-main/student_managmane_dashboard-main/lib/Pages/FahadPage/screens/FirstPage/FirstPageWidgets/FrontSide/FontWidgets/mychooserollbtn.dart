import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/login_page/module/home/presentation/home_screen.dart';

class MyChooseBtn extends StatefulWidget {
  const MyChooseBtn({super.key});

  @override
  State<MyChooseBtn> createState() => _MyChooseBtnState();
}

class _MyChooseBtnState extends State<MyChooseBtn>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> widthFirstAnimatedContainer;
  late final Animation<double> heightFirstAnimatedContainer;
  late final Animation<double> opacityFirstAnimatedContainer;
  late final Animation<AlignmentGeometry> alignFirstAnimatedContainer;
  // late final Animation<AlignmentGeometry> alignSecondAnimatedContainer;
  late final Animation<double> widthSecondAnimatedContainer;
  late final Animation<double> heightSecondAnimatedContainer;
  late final Animation<double> opacitySecondAnimatedContainer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700))
      ..addListener(() {
        setState(() {});
      });

    widthFirstAnimatedContainer = Tween<double>(begin: 0.6, end: 0.1).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0, 0.3)));
    heightFirstAnimatedContainer = Tween<double>(begin: 0.1, end: 0.2).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0, 0.3)));
    alignFirstAnimatedContainer = Tween<AlignmentGeometry>(
            begin: const Alignment(0.1, 0.3), end: const Alignment(-0.7, 0.3))
        .animate(CurvedAnimation(
            parent: _animationController, curve: const Interval(0, 0.3)));
    opacityFirstAnimatedContainer = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0, 0.3)));
    widthSecondAnimatedContainer = Tween<double>(begin: 0, end: 0.6).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.3, 0.6)));
    heightSecondAnimatedContainer = Tween<double>(begin: 0.02, end: 0.2)
        .animate(CurvedAnimation(
            parent: _animationController, curve: const Interval(0.6, 0.9)));
    // alignSecondAnimatedContainer = Tween<AlignmentGeometry>(begin: Alignment(-0.8, 0.3),end: )
    opacitySecondAnimatedContainer = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.9, 1)));

    // _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
        // ANIMATED LIST BTN Stack
        Stack(
            clipBehavior: Clip.none,
            // alignment: Alignment.center,
            children: [
          // Lower  CONTAINER  OF LIST
          Align(
            alignment: const Alignment(0.2, 0.3),
            child: Container(
                width: width * widthSecondAnimatedContainer.value,
                height: height * heightSecondAnimatedContainer.value,
                decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 202, 149, 255),
                    color: const Color.fromARGB(181, 60, 183, 197),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(width * 0.1),
                        bottomRight: Radius.circular(width * 0.1))),
                child: Opacity(
                  opacity: opacitySecondAnimatedContainer.value,
                  child: (Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SUPER ADMIN BTN
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Super Admin',
                            style: TextStyle(
                                fontSize: (height *
                                        heightSecondAnimatedContainer.value) *
                                    0.15,
                                color: Colors.white),
                          )),
                      // ADMIN BTN
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Admin',
                            style: TextStyle(
                                fontSize: (height *
                                        heightSecondAnimatedContainer.value) *
                                    0.15,
                                color: Colors.white),
                          )),
                      // STUDENT BTN
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginPage.name);
                          },
                          child: Text(
                            'Student',
                            style: TextStyle(
                                fontSize: (height *
                                        heightSecondAnimatedContainer.value) *
                                    0.15,
                                color: Colors.white),
                          )),
                    ],
                  )),
                )),
          ),
          // UPPER CONTAINER OPENER OF LIST
          GestureDetector(
            onTap: () {
              if (_animationController.status == AnimationStatus.completed &&
                  _animationController.status != AnimationStatus.forward) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
            },
            // CHOOSE RULE CONTAINER BTN
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.15),
              child: SizedBox(
                width: width * widthFirstAnimatedContainer.value,
                height: height * heightFirstAnimatedContainer.value,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(width * 0.2),
                          bottomRight: Radius.circular(width * 0.2)),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(3, 3),
                            color: Colors.black38,
                            blurRadius: 1,
                            spreadRadius: 1),
                        // BoxShadow(
                        //     offset: Offset(-1, -1),
                        //     color: Colors.white70,
                        //     blurRadius: 3,
                        //     spreadRadius: 3),
                      ]),
                  child: Opacity(
                    opacity: opacityFirstAnimatedContainer.value,
                    child: Center(
                        child: FittedBox(
                            child: Text(
                      'Choose Rule',
                      style: TextStyle(fontSize: (height * 0.1) * 0.3),
                    ))),
                  ),
                ),
              ),
            ),
          ),
        ]);
  }
}
