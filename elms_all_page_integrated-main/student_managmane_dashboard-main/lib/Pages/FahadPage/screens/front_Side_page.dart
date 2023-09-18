import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardPage/dashboard_page.dart';
import 'package:student_managmane_dashboard/Pages/login_page/login_page.dart';
import '../../FahadPage/model/holder.dart';
import '../../FahadPage/screens/casian_animated_list.dart';

import 'package:glassmorphism/glassmorphism.dart';

import '../done_uselessFile/workshop_time_tracker_page.dart';
// import '../model/rotate_animation_holder_manager.dart';
import 'courses_offer.dart';

import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

class FrontSideOfFirstPage extends StatefulWidget {
  const FrontSideOfFirstPage({super.key});

  @override
  State<FrontSideOfFirstPage> createState() => _FrontSideOfFirstPageState();
}

class _FrontSideOfFirstPageState extends State<FrontSideOfFirstPage>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> widthFirstAnimatedContainer;
  late final Animation<double> heightFirstAnimatedContainer;
  late final Animation<double> opacityFirstAnimatedContainer;
  late final Animation<AlignmentGeometry> alignFirstAnimatedContainer;
  // late final Animation<AlignmentGeometry> alignSecondAnimatedContainer;
  late final Animation<double> widthSecondAnimatedContainer;
  late final Animation<double> heightSecondAnimatedContainer;
  late final Animation<double> opacitySecondAnimatedContainer;

  final String casLogoTag = 'cas-logo';

  contactButton() {
    Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return const CoursesOfferPage();
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }));
  }

  coursesBtn() {
    Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return const CoursesOfferPage();
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }));
  }

  storieButton() {
    Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
          return const CasianAnimatedListPage();
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }));
  }

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

  onTapOnLinkdin() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('LinkDin Profile Not Available')));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.center,

      // ....................................................................... GLASSMARHPIC_CONTAINER
      child: GlassmorphicContainer(
        alignment: AlignmentDirectional.center,
        width: width * 0.9,
        height: height * 0.98,
        border: 5,
        blur: 10,
        borderGradient: const LinearGradient(colors: [
          Colors.white30,
          Colors.black38,
        ]),
        borderRadius: 10,
        linearGradient: const LinearGradient(
          colors: [
            Color.fromARGB(33, 255, 255, 255),
            Color.fromARGB(20, 0, 0, 0),
            Color.fromARGB(33, 255, 255, 255),
          ],
        ),

        // COLUMB
        child: ListView(children: [
          Stack(children: [
            // ................................................................... First Stack FOR TOP LEFT POP ICON

            //.................................................................... SECOND STACK FOR UI

            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: height * 0.04,
              ),
              FittedBox(
                child: Text(
                  'Well Come',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.027,
                      fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(
                height: height * 0.04,
              ),
              // ............................................................... SLIDER FOR IMAGES
              FanCarouselImageSlider(
                  isClickable: false,
                  expandedImageFitMode: BoxFit.fill,
                  indicatorActiveColor: Colors.blue,
                  isAssets: true,
                  imageRadius: 2,
                  imagesLink: DataHolder.ImageListForWorkShop,
                  sliderHeight: height * 0.3),

              // ................................................................. TOP ICON FOR POP THE SCREEN

              // Stack(children: [
              //   Container(
              //     height: height * 0.2,
              //     width: width,

              //     // color: Colors.amber,
              //     child: Center(
              //       child: Image.asset(
              //         'assets/images/caslogo.png',
              //       ),
              //     ),
              //   ),
              //   Center(
              //     child: Container(
              //       width: width * 0.85,
              //       height: height * 0.25,
              //       decoration: BoxDecoration(
              //           border: Border.all(width: 1),
              //           gradient: const LinearGradient(
              //               colors: [
              //                 Color.fromARGB(151, 239, 233, 246),
              //                 Color.fromARGB(121, 255, 255, 255),
              //                 Color.fromARGB(85, 255, 255, 255),
              //                 Colors.black12
              //               ],
              //               stops: [
              //                 0.2,
              //                 0.4,
              //                 0.6,
              //                 1
              //               ],
              //               begin: Alignment.bottomCenter,
              //               end: Alignment.topCenter),
              //           borderRadius: BorderRadius.circular(30)),
              //     ),
              //   )
              // ]),
              // ................

              SizedBox(
                height: height * 0.04,
              ),
              // TITLE
              FittedBox(
                child: Text(
                  'Center For Advance Solution',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.027,
                      fontWeight: FontWeight.bold),
                ),
              ),

              SizedBox(
                height: height * 0.02,
              ),
              // TITLE MESSAGE
              FittedBox(
                child: Text(
                  '''Brighten you future by Learning advance 
                  Technologies form Here''',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: height * 0.02,
                  ),
                  // maxLines: 2,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),

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
                              color: Color.fromARGB(181, 60, 183, 197),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(width * 0.1),
                                  bottomRight: Radius.circular(width * 0.1))),
                          child: Opacity(
                            opacity: opacitySecondAnimatedContainer.value,
                            child: (Column(
                              children: [
                                // SUPER ADMIN BTN
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Super Admin',
                                      style: TextStyle(
                                          fontSize: (height *
                                                  heightSecondAnimatedContainer
                                                      .value) *
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
                                                  heightSecondAnimatedContainer
                                                      .value) *
                                              0.15,
                                          color: Colors.white),
                                    )),
                                // STUDENT BTN
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, LoginPage.name);
                                    },
                                    child: Text(
                                      'Student',
                                      style: TextStyle(
                                          fontSize: (height *
                                                  heightSecondAnimatedContainer
                                                      .value) *
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
                        if (_animationController.status ==
                                AnimationStatus.completed &&
                            _animationController.status !=
                                AnimationStatus.forward) {
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
                                style:
                                    TextStyle(fontSize: (height * 0.1) * 0.3),
                              ))),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),

              SizedBox(
                height: height * 0.04,
              ),
              // ROW FOR BTNs At Last
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // CONTACT BUTTON
                  OutlinedButton(
                      style: const ButtonStyle(
                          // backgroundColor: MaterialStatePropertyAll(Colors.white),
                          ),
                      onPressed: storieButton,
                      child: const FittedBox(
                        child: Text(
                          'Success Stories',
                          style: TextStyle(
                            color: Colors.white,
                            // fontSize: height*0.02,
                          ),
                        ),
                      )),

                  // COURSES BUTTON
                  OutlinedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: coursesBtn,
                      child: const FittedBox(
                        child: Text(
                          '      Courses      ',
                          style: TextStyle(
                              // color: Colors.white,

                              ),
                        ),
                      )),
                ],
              ),

              // Distance B/W ROW BTN AND CONTACT BTN
              SizedBox(
                height: height * 0.02,
              ),
              // ................................................................. Contact Button
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: width * 0.5,
                  child: Stack(
                    children: [
                      // CONTACT BUTTON
                      InkWell(
                        onTap: contactButton,
                        child: Padding(
                          padding: EdgeInsets.only(top: height * 0.015),
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            width: width * 0.4,
                            height: height * 0.055,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(height * 0.03)),
                                border: Border.all(
                                  width: 2,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: Colors.white,
                                ),
                                color: Color.fromARGB(207, 249, 249, 249),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black38,
                                      offset: Offset(3, 3),
                                      blurRadius: 1,
                                      spreadRadius: 1)
                                ]),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: UnconstrainedBox(
                                child: SizedBox(
                                    height: height * 0.035,
                                    child: const FittedBox(
                                        child: Text(
                                      'Contact Us',
                                    ))),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Icon BUTTTON ON CONTACT BUTTON
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: width * 0.18,
                          height: height * 0.08,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(-2, 2),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  color: Colors.black38),
                              BoxShadow(
                                  offset: Offset(-2, -2),
                                  color: Colors.black38,
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ],
                            border: Border.all(
                              color: Colors.black38,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: Icon(Icons.phone, color: Colors.green),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ]),
        ]),
      ),
    );
  }
}
