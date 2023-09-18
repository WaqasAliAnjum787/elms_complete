import 'package:flutter/material.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardPage/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String name = "login";

  @override
  State<LoginPage> createState() => _StackRemoved();
}

class _StackRemoved extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> containerSlideAnimation;
  late Animation<double> scaleYValue;

  // late AnimationController _opacityAnimationController;

  late Animation<double> firstTextFieldComingFromLeftAnimation;
  late Animation<double> secondTextFieldComingFromRightAnimation;
  late Animation<double> signInButtonScaleAnimation;
  late Animation<double> thirdTextFieldComingFromLeftAnimation;
  late Animation<double> forthTextFieldComingFromRightAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.addStatusListener((status) {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    containerSlideAnimation = Tween<double>(begin: 2.5, end: 1).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.0, 0.4, curve: Curves.linear)));

    scaleYValue = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.4, curve: Curves.linear)));

    firstTextFieldComingFromLeftAnimation = Tween<double>(begin: -20, end: 0)
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.4, 0.5, curve: Curves.bounceInOut)));

    secondTextFieldComingFromRightAnimation = Tween<double>(begin: 20, end: 0)
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.5, 0.6, curve: Curves.easeInOut)));

    signInButtonScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.5, 0.9, curve: Curves.bounceInOut)));

    thirdTextFieldComingFromLeftAnimation = Tween<double>(begin: -5, end: 0)
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.8, 0.9, curve: Curves.easeInOut)));

    forthTextFieldComingFromRightAnimation = Tween<double>(begin: 5, end: 0)
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.9, 1.0, curve: Curves.bounceInOut)));

    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * 0.5,
              width: screenWidth,
              decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  image: const DecorationImage(
                      image: AssetImage("assets/images/back.png"),
                      fit: BoxFit.contain)),
            ),
            Transform.scale(
              scaleY: scaleYValue.value,
              alignment: Alignment(0, containerSlideAnimation.value),
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.5,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0, 134, 223),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment(
                          firstTextFieldComingFromLeftAnimation.value, 0),
                      child: SizedBox(
                        width: screenWidth * 0.9,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2)),
                              focusColor: Colors.white,
                              prefixIcon: const Icon(Icons.email_outlined),
                              prefixIconColor: Colors.white,
                              labelText: "Enter the Email",
                              labelStyle: const TextStyle(color: Colors.white),
                              floatingLabelStyle:
                                  const TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2))),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: screenHeight * 0.01,
                    // ),
                    Align(
                      alignment: Alignment(
                          secondTextFieldComingFromRightAnimation.value, 0),
                      child: SizedBox(
                        width: screenWidth * 0.9,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2)),
                              focusColor: Colors.white,
                              prefixIcon:
                                  const Icon(Icons.lock_outline_rounded),
                              prefixIconColor: Colors.white,
                              labelText: "Enter Password",
                              labelStyle: const TextStyle(color: Colors.white),
                              suffixIcon: const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.remove_red_eye_outlined)),
                              suffixIconColor: Colors.white,
                              floatingLabelStyle:
                                  const TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2))),
                        ),
                      ),
                    ),

                    ScaleTransition(
                      scale: signInButtonScaleAnimation,
                      child: SizedBox(
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.075,
                        child: NeoPopTiltedButton(
                          isFloating: true,
                          onTapUp: () {
                            Navigator.pushNamed(context, Dashboard.name);
                          },
                          decoration: const NeoPopTiltedButtonDecoration(
                            color: Color.fromARGB(255, 0, 97, 176),
                            plunkColor: Color.fromARGB(255, 0, 97, 176),
                            shadowColor: Color.fromRGBO(36, 36, 36, 1),
                            showShimmer: false,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 70.0,
                              vertical: 5,
                            ),
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: screenHeight * 0.01,
                    // ),
                    // Container(
                    //   width: screenWidth * 0.4,
                    //   height: screenHeight * 0.065,
                    //   decoration: BoxDecoration(
                    //     color: Color.fromARGB(255, 0, 97, 176),
                    //     border: Border.all(color: Colors.white, width: 2),
                    //     borderRadius: BorderRadius.circular(30),
                    //   ),
                    //   alignment: Alignment.center,
                    //   child: Text(
                    //     "Sign In",
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 22,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // // SizedBox(
                    // //   height: screenHeight * 0.007,
                    // // ),
                    Align(
                      alignment: Alignment(
                          thirdTextFieldComingFromLeftAnimation.value, 0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forget Password ??",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: screenHeight * 0.007,
                    // ),
                    Align(
                      alignment: Alignment(
                          forthTextFieldComingFromRightAnimation.value, 0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "New User ?? Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
