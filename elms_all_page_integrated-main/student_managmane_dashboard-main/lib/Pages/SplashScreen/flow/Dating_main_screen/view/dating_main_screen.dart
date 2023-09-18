import 'package:auto_size_text/auto_size_text.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';
import 'package:student_managmane_dashboard/Pages/FahadPage/screens/first_page.dart';
import '../../../../SplashScreen/flow/Dating_main_screen/widgets/dating_screen_widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../../../utils/ScreenBasicElements.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const name = 'splashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  //Input field controllers
  late TextEditingController nameController, ageController;
  //btn tweens and animations
  late Tween<double> sizeTween;
  late Tween<Color> colorTween;
  late Tween<String> textTween;
  late Animation<double> sizeAnimation;
  late Animation<Color?> colorAnimation;
  late Animation<String> textAnimation;
  late AnimationController controller,
      clipperController,
      secondScreenShiftController,
      thirdScreenShiftController,
      thirdScreenpositionController;
  //top clipper tweens and animations

  late Animation<double> startLineWidthAnimation,
      secondLineWidthAnimation,
      secondLineheightAnimation,
      firstQDBstartWidthAnimation,
      firstQDBstartHeightAnimation,
      firstQDBendWidthAnimation,
      firstQDBendHeightAnimation,
      secondQDBstartWidthAnimation;

  //second clipper
  late Animation<double> BstartLineWidthAnimation,
      BfirstQDBstartHeightAnimation,
      BfirstQDBendWidthAnimation,
      BfirstQDBendHeightAnimation,
      BsecondQDBstartWidthAnimation,
      BsecondQDBstartHeightAnimation,
      BsecondQDBendHeightAnimation;
  int dotPosition = 0;
  //second screen shift animations
  late Animation<double> firstScreenWidgetsOpacityAnimation,
      secondScreenWidgetsOpacityAnimation,
      firstScreenReplaceValue;
  //third screen position
  late Animation<double> thirdScreenTextPositionanimation;

  //opacity values
  double firstScreenOpacity = 1,
      secondScreenOpacity = 0,
      secondScreenDismiss = 0,
      thirdScreenBigButtonOpacity = 0,
      bottomRightButtonOpacity = 1;
  String text = "CS Student";
  double sizeValue = 0.78;
  int currentScreen = 1;
  bool isCurrentBigShape = false;
  //top bottom clipper width and heights
  late double topClipperWidth,
      bottomClipperWidth,
      topClipperHeight,
      bottomClipperHeight;
  bool isFirst = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    nameController = TextEditingController();
    ageController = TextEditingController();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    clipperController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    clipperController.addListener(() {
      setState(() {});
    });
    secondScreenShiftController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    thirdScreenShiftController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    controller.addListener(() {
      setState(() {});
    });

    secondScreenShiftController.addListener(() {
      setState(() {});
    });

    thirdScreenShiftController.addListener(() {
      print(thirdScreenShiftController.value);
      setState(() {});
    });
    thirdScreenpositionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    thirdScreenpositionController.addListener(() {
      setState(() {});
    });

    //top clipper
    startLineWidthAnimation =
        Tween(begin: 0.7, end: 1.0).animate(clipperController);
    secondLineheightAnimation = Tween(begin: 0.0, end: 0.72).animate(
      CurvedAnimation(
        parent: clipperController,
        curve: const Interval(
          0.6,
          1.0,
        ),
      ),
    );
    secondLineWidthAnimation = Tween(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: clipperController,
        curve: const Interval(
          0.6,
          1.0,
        ),
      ),
    );
    firstQDBstartWidthAnimation =
        Tween(begin: 1.0, end: 0.8).animate(clipperController);
    firstQDBstartHeightAnimation =
        Tween(begin: 0.4, end: 1.0).animate(clipperController);
    firstQDBendWidthAnimation =
        Tween(begin: 0.75, end: 0.4).animate(clipperController);
    firstQDBendHeightAnimation =
        Tween(begin: 0.75, end: 1.0).animate(clipperController);
    secondQDBstartWidthAnimation =
        Tween(begin: 0.55, end: 0.28).animate(clipperController);
    //second clipper
    BstartLineWidthAnimation =
        Tween(begin: 0.25, end: 0.08).animate(clipperController);
    BfirstQDBstartHeightAnimation =
        Tween(begin: 0.46, end: 0.4).animate(clipperController);
    BfirstQDBendWidthAnimation =
        Tween(begin: 0.38, end: 0.26).animate(clipperController);
    BfirstQDBendHeightAnimation =
        Tween(begin: 0.22, end: 0.1).animate(clipperController);
    BsecondQDBstartWidthAnimation =
        Tween(begin: 0.55, end: 0.5).animate(clipperController);
    BsecondQDBstartHeightAnimation =
        Tween(begin: 0.09, end: 0.0).animate(clipperController);
    BsecondQDBendHeightAnimation =
        Tween(begin: 0.12, end: 0.1).animate(clipperController);

    firstScreenReplaceValue =
        Tween(begin: 1.0, end: 0.0).animate(secondScreenShiftController);
    colorAnimation = ColorTween(
            begin: const Color.fromRGBO(215, 137, 152, 1), end: secondaryColor)
        .animate(controller);
    //third screen
    thirdScreenTextPositionanimation =
        Tween(begin: 1.0, end: 0.06).animate(thirdScreenpositionController);
  }

  @override
  Widget build(BuildContext context) {
    initialize(context);
    if (!isFirst) {
      topClipperWidth = customWidth();
      bottomClipperWidth = customWidth();
      topClipperHeight = customHeight(0.55);
      bottomClipperHeight = customHeight(0.45);
      isFirst = true;
    }

    sizeAnimation = Tween(begin: customWidth(0.55), end: customWidth(0.4))
        .animate(controller);

    return WillPopScope(
      onWillPop: () async {
        //repeat same backbutton code to handle it
        return false;
      },
      child: Scaffold(
        body: SizedBox(
          height: customHeight(),
          child: Center(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Stack(children: [
                    ClipPath(
                      clipper: TopCircleClipper(
                          startLineWidthAnimation:
                              startLineWidthAnimation.value,
                          firstQDBstartWidthAnimation:
                              firstQDBstartWidthAnimation.value,
                          firstQDBstartHeightAnimation:
                              firstQDBstartHeightAnimation.value,
                          firstQDBendWidthAnimation:
                              firstQDBendWidthAnimation.value,
                          firstQDBendHeightAnimation:
                              firstQDBendHeightAnimation.value,
                          secondLineWidthAnimation:
                              startLineWidthAnimation.value,
                          secondLineheightAnimation:
                              secondLineheightAnimation.value,
                          secondQDBstartWidthAnimation:
                              secondQDBstartWidthAnimation.value),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        color: const Color.fromRGBO(235, 216, 217, 1),
                        width: topClipperWidth,
                        height: topClipperHeight,
                      ),
                    ),
                  ]),
                ),
                //top backbutton
                Positioned(
                  left: customWidth(0.06),
                  top: topBarSize * 1.4,
                  child: SizedBox(
                    height: customHeight(0.09),
                    child: Row(
                      children: [
                        FloatingActionButton(
                          heroTag: 'First',
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          onPressed: () {
                            if (dotPosition != 0) {
                              dotPosition = dotPosition - 1;

                              setState(() {});
                              if (currentScreen == 1) {
                                if (clipperController.isCompleted) {
                                  sizeValue = 0.82;

                                  clipperController.reverse().then((value) {});
                                  isCurrentBigShape = false;
                                } else {
                                  sizeValue = 0.78;

                                  clipperController.forward().then((value) {});
                                  isCurrentBigShape = true;
                                }
                                firstScreenOpacity = 1;
                                secondScreenOpacity = 0;
                                secondScreenDismiss = 0;
                                setState(() {});
                              } else if (currentScreen == 2) {
                                if (clipperController.isCompleted) {
                                  sizeValue = 0.82;

                                  clipperController.reverse().then((value) {});
                                  isCurrentBigShape = false;
                                } else {
                                  sizeValue = 0.78;

                                  clipperController.forward().then((value) {});
                                  isCurrentBigShape = true;
                                }
                                firstScreenOpacity = 1;
                                secondScreenOpacity = 0;
                                secondScreenDismiss = 0;
                                currentScreen = 1;

                                setState(() {});
                              } else {
                                secondScreenOpacity = 1;
                                secondScreenDismiss = 1;
                                topClipperWidth = customWidth();
                                bottomClipperWidth = customWidth();
                                topClipperHeight = customHeight(0.55);
                                bottomClipperHeight = customHeight(0.45);
                                currentScreen = 2;
                                thirdScreenpositionController.reverse();
                                //third screen buttons
                                bottomRightButtonOpacity = 1;
                                thirdScreenBigButtonOpacity = 0;
                                setState(() {});
                              }
                            }
                          },
                          child: Icon(
                            Icons.arrow_back_sharp,
                            size: customFontSize(0.06),
                            color: secondaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Stack(children: [
                    //bottom clipper
                    ClipPath(
                      clipper: BottomCircleClipper(
                          startLineWidthAnimation:
                              BstartLineWidthAnimation.value,
                          firstQDBstartHeightAnimation:
                              BfirstQDBstartHeightAnimation.value,
                          firstQDBendWidthAnimation:
                              BfirstQDBendWidthAnimation.value,
                          firstQDBendHeightAnimation:
                              BfirstQDBendHeightAnimation.value,
                          secondQDBstartWidthAnimation:
                              BsecondQDBstartWidthAnimation.value,
                          secondQDBstartHeightAnimation:
                              BsecondQDBstartHeightAnimation.value,
                          secondQDBendHeightAnimation:
                              BsecondQDBendHeightAnimation.value),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        color: const Color.fromARGB(212, 200, 223, 228),
                        width: bottomClipperWidth,
                        height: bottomClipperHeight,
                      ),
                    ),
                  ]),
                ),
                Positioned(
                  top: customHeight(0.55),
                  left: customWidth(0.05),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: firstScreenOpacity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //I am a text
                        Padding(
                          padding: EdgeInsets.only(left: customWidth(0.02)),
                          child: SizedBox(
                            height: customHeight(0.08),
                            child: FittedBox(
                              child: AutoSizeText(
                                "I am a",
                                style: TextStyle(
                                    fontSize: customFontSize(0.09),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        //first button
                        InkWell(
                          splashFactory: NoSplash.splashFactory,
                          splashColor: Colors.transparent,
                          onTap: () {
                            if (clipperController.isCompleted) {
                              sizeValue = 0.82;
                              clipperController.reverse().then((value) => null);

                              controller.reverse().then((value) {
                                text = "CS Student";
                              });
                              isCurrentBigShape = false;
                            } else {
                              sizeValue = 0.78;

                              controller.forward().then((value) {});
                              clipperController.forward().then((value) => null);
                              text = "Learner";
                              isCurrentBigShape = true;
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: colorAnimation.value,
                            ),
                            width: sizeAnimation.value,
                            height: customHeight(0.08),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: customWidth(0.02),
                                  height: customHeight(0.08),
                                ),
                                SizedBox(
                                  width: sizeAnimation.value * sizeValue,
                                  height: customHeight(0.08),
                                  child: FittedBox(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: AutoSizeText(
                                        text,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: customFontSize(0.08),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: customWidth(0.04),
                                  height: customWidth(0.04),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //second text
                        Padding(
                          padding: EdgeInsets.only(left: customWidth(0.02)),
                          child: SizedBox(
                            height: customHeight(0.08),
                            child: FittedBox(
                              child: AutoSizeText(
                                "looking for",
                                style: TextStyle(
                                    fontSize: customFontSize(0.09),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        //second button
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: secondaryColor,
                          ),
                          width: customWidth(0.4),
                          height: customHeight(0.08),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: customWidth(0.02),
                                height: customHeight(0.08),
                              ),
                              SizedBox(
                                width: customWidth(0.3),
                                height: customHeight(0.08),
                                child: FittedBox(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      "Mentor",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: customFontSize(0.08),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: customWidth(0.04),
                                height: customWidth(0.04),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //////////           /////////////         /////////////////
                ///second screen
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: secondScreenOpacity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: customWidth(),
                        height: customHeight(0.45),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: customWidth(0.04), top: customHeight(0.04)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: customWidth(0.01)),
                                  child: secondScreenDismiss == 1
                                      ? SizedBox(
                                          height: customHeight(0.05),
                                          child: FittedBox(
                                            child: AutoSizeText(
                                              "Center for Advance Studies",
                                              style: TextStyle(
                                                  fontSize:
                                                      customFontSize(0.07),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                      : const SizedBox()),
                              // // first field
                              // secondScreenDismiss == 1
                              //     ? SizedBox(
                              //         width: customWidth(0.8),
                              //         height: customHeight(0.08),
                              //         child:
                              //         TextFormField(
                              //           controller: nameController,
                              //           cursorColor: const Color.fromRGBO(
                              //               215, 137, 152, 1),
                              //           style: TextStyle(
                              //               fontSize: customFontSize(0.035),
                              //               fontWeight: FontWeight.bold),
                              //           decoration: InputDecoration(
                              //             contentPadding: const EdgeInsets.only(
                              //                 left: 15,
                              //                 right: 15,
                              //                 top: 10,
                              //                 bottom: 10),
                              //             focusedBorder: OutlineInputBorder(
                              //               borderSide: const BorderSide(
                              //                   width: 4,
                              //                   color: Color.fromRGBO(
                              //                       215, 137, 152, 1)),
                              //               borderRadius:
                              //                   BorderRadius.circular(80.0),
                              //             ),
                              //             enabledBorder: OutlineInputBorder(
                              //               borderSide: const BorderSide(
                              //                   width: 4,
                              //                   color: Color.fromRGBO(
                              //                       215, 137, 152, 1)),
                              //               borderRadius:
                              //                   BorderRadius.circular(80.0),
                              //             ), //
                              //             border: OutlineInputBorder(
                              //               borderSide: const BorderSide(
                              //                   width: 4,
                              //                   color: Color.fromRGBO(
                              //                       215, 137, 152, 1)),
                              //               borderRadius:
                              //                   BorderRadius.circular(80.0),
                              //             ),
                              //           ),
                              //         ),
                              //       )
                              //     : const SizedBox(),

                              // //  second text
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: customWidth(0.01)),
                                  child: secondScreenDismiss == 1
                                      ? SizedBox(
                                          height: customHeight(0.05),
                                          child: FittedBox(
                                            child: AutoSizeText(
                                              "CAS",
                                              style: TextStyle(
                                                  fontSize:
                                                      customFontSize(0.09),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                      : const SizedBox()),
                              // //  second field
                              // secondScreenDismiss == 1
                              // ? Container(
                              //     height: customHeight(0.09),
                              //     child: Row(
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.center,
                              //       children: [
                              //         SizedBox(
                              //           width: customWidth(0.25),
                              //           height: customHeight(0.08),
                              //           child: TextFormField(
                              //             controller: ageController,
                              //             cursorColor: const Color.fromRGBO(
                              //                 215, 137, 152, 1),
                              //             style: TextStyle(
                              //                 fontSize:
                              //                     customFontSize(0.035),
                              //                 fontWeight: FontWeight.bold),
                              //             decoration: InputDecoration(
                              //               contentPadding:
                              //                   const EdgeInsets.only(
                              //                       left: 15,
                              //                       right: 15,
                              //                       top: 10,
                              //                       bottom: 10),
                              //               focusedBorder:
                              //                   OutlineInputBorder(
                              //                 borderSide: const BorderSide(
                              //                     width: 4,
                              //                     color: Color.fromRGBO(
                              //                         215, 137, 152, 1)),
                              //                 borderRadius:
                              //                     BorderRadius.circular(
                              //                         80.0),
                              //               ),
                              //               enabledBorder:
                              //                   OutlineInputBorder(
                              //                 borderSide: const BorderSide(
                              //                     width: 4,
                              //                     color: Color.fromRGBO(
                              //                         215, 137, 152, 1)),
                              //                 borderRadius:
                              //                     BorderRadius.circular(
                              //                         80.0),
                              //               ), //
                              //               border: OutlineInputBorder(
                              //                 borderSide: const BorderSide(
                              //                     width: 4,
                              //                     color: Color.fromRGBO(
                              //                         215, 137, 152, 1)),
                              //                 borderRadius:
                              //                     BorderRadius.circular(
                              //                         80.0),
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //         Padding(
                              //           padding: EdgeInsets.only(
                              //               bottom: customHeight(0.02)),
                              //           child: SizedBox(
                              //             height: customHeight(0.07),
                              //             child: Center(
                              //               child: FittedBox(
                              //                 child: AutoSizeText(
                              //                   " years old",
                              //                   textAlign: TextAlign.center,
                              //                   style: TextStyle(
                              //                       fontSize:
                              //                           customFontSize(
                              //                               0.09),
                              //                       fontWeight:
                              //                           FontWeight.bold),
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   )
                              // : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //////third screen text
                Positioned(
                  top: customHeight(0.2),
                  left: customWidth(thirdScreenTextPositionanimation.value),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: customHeight(0.05),
                        child: FittedBox(
                          child: AutoSizeText(
                            "That's it,",
                            style: TextStyle(
                                fontSize: customFontSize(0.09),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: customHeight(0.07),
                        child: FittedBox(
                          child: AutoSizeText(
                            "Casian",
                            style: TextStyle(
                                fontSize: customFontSize(0.09),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: customHeight(0.05),
                        child: FittedBox(
                          child: AutoSizeText(
                            "Enjoy your journy",
                            style: TextStyle(
                                fontSize: customFontSize(0.09),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //bottom row
                Positioned(
                  top: customHeight(0.89),
                  left: customWidth(0.06),
                  child: SizedBox(
                    width: customWidth(0.89),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DotsIndicator(
                          decorator: const DotsDecorator(
                              activeColor: secondaryColor, color: Colors.grey),
                          dotsCount: 3,
                          position: dotPosition,
                        ),
                        //bottom end button
                        SizedBox(
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 600),
                                opacity: bottomRightButtonOpacity,
                                child: SizedBox(
                                  height: customHeight(0.09),
                                  child: Row(
                                    children: [
                                      FloatingActionButton(
                                        heroTag: 'Second',
                                        backgroundColor: Colors.white,
                                        shape: const CircleBorder(),
                                        onPressed: () async {
                                          if (dotPosition != 2) {
                                            dotPosition = dotPosition + 1;
                                          }
                                          setState(() {});
                                          if (currentScreen == 1) {
                                            if (clipperController.isCompleted) {
                                              sizeValue = 0.82;

                                              clipperController
                                                  .reverse()
                                                  .then((value) {});
                                              isCurrentBigShape = false;
                                            } else {
                                              sizeValue = 0.78;

                                              clipperController
                                                  .forward()
                                                  .then((value) {});
                                              isCurrentBigShape = true;
                                            }
                                            firstScreenOpacity = 0;
                                            secondScreenOpacity = 1;
                                            secondScreenDismiss = 1;
                                            currentScreen = 2;

                                            //third screen buttons
                                            bottomRightButtonOpacity = 1;
                                            thirdScreenBigButtonOpacity = 0;
                                            setState(() {});
                                          } else {
                                            if (isCurrentBigShape == false) {
                                              topClipperWidth = customWidth(0);
                                            }

                                            bottomClipperWidth = customWidth(0);
                                            topClipperHeight = customHeight(0);
                                            bottomClipperHeight =
                                                customHeight(0);
                                            currentScreen = 3;
                                            secondScreenOpacity = 0;
                                            thirdScreenpositionController
                                                .forward();
                                            bottomRightButtonOpacity = 0;
                                            thirdScreenBigButtonOpacity = 1;
                                            setState(() {});
                                            await Future.delayed(const Duration(
                                                milliseconds: 800));

                                            secondScreenDismiss = 0;
                                            setState(() {});
                                          }
                                        },
                                        child: Icon(Icons.arrow_forward_sharp,
                                            size: customFontSize(0.06),
                                            color: secondaryColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              //third screen big button
                              InkWell(
                                splashFactory: NoSplash.splashFactory,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pushNamed(context, FirstPage.name);
                                },
                                child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 600),
                                    opacity: thirdScreenBigButtonOpacity,
                                    child: thirdScreenBigButtonOpacity == 1
                                        ? Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(60),
                                              color: secondaryColor,
                                            ),
                                            width: customWidth(0.4),
                                            height: customHeight(0.08),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: customWidth(0.03),
                                                  height: customHeight(0.08),
                                                ),
                                                SizedBox(
                                                  width: customWidth(0.25),
                                                  height: customHeight(0.055),
                                                  child: FittedBox(
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: AutoSizeText(
                                                        "Login",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                customFontSize(
                                                                    0.08),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: SizedBox(
                                                    width: customWidth(0.1),
                                                    child: Icon(
                                                      Icons.arrow_forward_sharp,
                                                      size:
                                                          customFontSize(0.05),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : const SizedBox()),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
