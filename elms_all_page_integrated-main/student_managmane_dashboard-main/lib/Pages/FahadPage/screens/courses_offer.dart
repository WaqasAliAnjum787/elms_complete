import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../FahadPage/model/holder.dart';
import '../../FahadPage/model/rotate_animation_holder_manager.dart';

import '../model/courses_model.dart';
// import 'package:student_managment_app_screens/model/courses_model.dart';
// import 'package:student_managment_app_screens/screens/back_side_page.dart';

class CoursesOfferPage extends StatefulWidget {
  const CoursesOfferPage({super.key});

  @override
  State<CoursesOfferPage> createState() => _CoursesOfferPageState();
}

class _CoursesOfferPageState extends State<CoursesOfferPage>
    with TickerProviderStateMixin {
  late AnimationController _casAnimationController;
  late Animation<AlignmentGeometry> _alignAnimation;
  late Animation<double> _scalAnimation;
  late Tween<double> _tweenAnimation;
  late final AnimationController _iconController;
  late final Animation<double> iconOffsetAnimation;

  double scaleSize = 0;
  double rotation = 1;

  @override
  void initState() {
    super.initState();
    _casAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _alignAnimation =
        Tween<AlignmentGeometry>(begin: Alignment(1.5, 0), end: Alignment(0, 0))
            .animate(_casAnimationController);
    _scalAnimation =
        Tween<double>(begin: 0, end: 1).animate(_casAnimationController);
    _tweenAnimation = Tween<double>(begin: 0, end: rotation);

    _iconController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    iconOffsetAnimation = Tween(begin: -100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _iconController,
        curve: const Interval(0.5, 1, curve: Curves.easeOut),
      ),
    );

    _iconController.forward();
  }

  @override
  void dispose() {
    _casAnimationController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    // double widthOfCouseCOntainer = 0;
    // double heightOfCouseCOntainer = 0;

    // return Scaffold(
    // body: Column(children: [
    //   Container(
    //     height: height * 0.2,
    //     width: width,
    //     decoration: BoxDecoration(
    //         color: Colors.blueAccent,
    //         borderRadius: BorderRadius.only(
    //             bottomLeft: Radius.circular(5),
    //             bottomRight: Radius.circular(5))),
    //     child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //       SizedBox(
    //           height: height * 0.05,
    //           child: Image.asset('assets/images/caslogo.png')),
    //       Text(
    //         'Courses We Offer',
    //         style: TextStyle(shadows: [
    //           BoxShadow(offset: Offset(1, 1), color: Colors.black38)
    //         ]),
    //       )
    //     ]),
    //   )
    // ]),
    // );

// ..........................................................................

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 225, 224),
      body: Stack(children: [
        // ................................................................... FIRST STACK BACKGROUND IMAGE
        Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/sky.jpg'),
                  fit: BoxFit.cover)),
        ),

        // AnimatedBackGround(),

        AnimatedBuilder(
            animation: iconOffsetAnimation,
            builder: (context, child) {
              return Transform.translate(
                  offset: Offset(iconOffsetAnimation.value, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);

                      _iconController.reverse();
                    },
                    child: const Align(
                      alignment: Alignment(-0.85, -0.85),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ));
            }),

        //...................................................................... Second Stack Child ( TEXT TITLE & ICON )

        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: height * 0.05,
          ),
          //// ................................................................... ROW FOR TEXT AND ICON
          //// ROW
          SizedBox(
            width: width,
            height: height * 0.15,
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: Row(children: [
                //.............................................................. TEXT TITLE
                Align(
                  alignment: const Alignment(-0.7, 0.3),
                  child: SizedBox(
                    width: width * 0.55,
                    child: const FittedBox(
                      child: Text(
                        'Courses We Offer',
                        style: TextStyle(
                          color: Colors.white,
                          //  fontSize: height * 0.1
                        ),
                      ),
                    ),
                  ),
                ),
                // // SIZE B/W TEXT AND ICON IN ROW
                SizedBox(
                  width: width * 0.1,
                ),
                //// .............................................................. LOGO CAS
                Hero(
                  tag: 'cas-logo',
                  child: Align(
                    alignment: const Alignment(0, 0.4),
                    child: SizedBox(
                        width: width * 0.25,
                        // height: height * 0.2,
                        child: Image.asset(
                          'assets/images/caslogo.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ]),
            ),
          ),
          //.................................................................... COURSES CONTAINER
        ]),
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
              width: width * 0.9,
              height: height * 0.8,
              child: Container(
                clipBehavior: Clip.antiAlias,
                // padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    // color: const Color.fromARGB(250, 21, 18, 46),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(230, 255, 255, 255),
                      Color.fromARGB(95, 37, 36, 36),
                      Color.fromARGB(90, 255, 255, 255)
                    ]),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width * 0.15))),
                // ........................................................... LIST OF COURSES

                child: ListView.builder(
                  itemCount: CoursesModel.cousesDataList.length,
                  itemBuilder: (context, index) {
                    _casAnimationController.forward();
                    // widthOfCouseCOntainer=w
                    // heightOfCouseCOntainer = (height * 0.8) * 0.5;
                    // _casAnimationController.forward();
                    return TweenAnimationBuilder(
                        tween: _tweenAnimation,
                        duration: const Duration(milliseconds: 500),
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: (value),
                            child: Transform.scale(
                              scale: value,
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: (height * 0.8) * 0.05,
                                      left: (width * 0.85) * 0.08,
                                      right: (width * 0.85) * 0.05),
                                  //  .................................................. CONTAINER FOR IMAGES AND COURSE NAME
                                  child: InkWell(
                                    onTap: () {
                                      // ....................................... Dialoge For Open Image By Click On InkWell
                                      showGeneralDialog(
                                        context: context,
                                        // anchorPoint: Offset(400, 400),
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          // ...............................Tween Builder for animtion During open of Dialoge
                                          return TweenAnimationBuilder(
                                            tween: _tweenAnimation,
                                            duration:
                                                Duration(milliseconds: 500),
                                            builder: (context, value, child) =>
                                                Transform.scale(
                                              scale: value,
                                              child: Opacity(
                                                opacity: value,

                                                //          .................... GlassMorphic in Dialoge
                                                child: UnconstrainedBox(
                                                    child:
                                                        GlassmorphicContainer(
                                                  width: width * 0.95,
                                                  height: height * 0.5,
                                                  borderRadius: 5,
                                                  linearGradient:
                                                      const LinearGradient(
                                                          colors: [
                                                        Colors.black38,
                                                        Colors.white38
                                                      ]),
                                                  border: 1,
                                                  blur: 5,
                                                  borderGradient:
                                                      const LinearGradient(
                                                          colors: [
                                                        Color.fromARGB(
                                                            165, 133, 131, 131),
                                                        Colors.black45,
                                                      ]),
                                                  // ........................... IMAGE IN DIALOGE
                                                  child: Stack(children: [
                                                    Center(
                                                      child: Image.asset(
                                                          CoursesModel
                                                              .cousesDataList[
                                                                  index]
                                                              .courseImageUrl,
                                                          fit: BoxFit.fill,
                                                          filterQuality:
                                                              FilterQuality
                                                                  .high),
                                                    ),
                                                  ]),
                                                )),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      // height: (height * 0.8) * 0.5,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                                  height * 0.8) *
                                              0.02,
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(3, 3),
                                                // spreadRadius: 2,
                                                blurRadius: 5),
                                            // BoxShadow(
                                            //     color: Colors.white38,
                                            //     offset: Offset(3, 3),
                                            //     spreadRadius: 2,
                                            //     blurRadius: 2),
                                          ],
                                          color: Colors.white),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: ((height * 0.8) * 0.01),
                                                left: (width * 0.9) * 0.02,
                                                right: (width * 0.9) * 0.02),
                                            //............................................ IMAGE IN CONTAINER
                                            child: SizedBox(
                                                height: ((height * 0.8) * 0.7) *
                                                    0.55,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              ((height * 0.8) *
                                                                      0.7) *
                                                                  0.0),
                                                      // boxShadow: [BoxShadow(offset: Offset(3, 3),color: Colors.black38)],
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              CoursesModel
                                                                  .cousesDataList[
                                                                      index]
                                                                  .courseImageUrl),
                                                          fit: BoxFit.fill)),
                                                )),
                                          ),
                                          // TEXT OF IMAGE
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: ((height * 0.8) * 0.02)),
                                            child: FittedBox(
                                              child: Text(
                                                CoursesModel
                                                    .cousesDataList[index]
                                                    .courseName,
                                                style: TextStyle(
                                                    fontSize: (((height * 0.8) *
                                                                0.7) *
                                                            0.5) *
                                                        0.1,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Open Sans',
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                          ),
                                          // Dotes for Just Design
                                          const Text('. . . . .')
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          );
                        });
                  },
                ),
              )),
        ),
      ]),
    );
  }
}
