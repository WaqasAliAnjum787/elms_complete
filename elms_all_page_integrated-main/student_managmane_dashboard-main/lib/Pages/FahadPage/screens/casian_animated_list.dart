// // import 'package:animated_list/casiasn.dart';
// // import 'package:animated_list/services.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/music_slide_animation/idial_file/liabrary_item.dart';
// import 'student_model.dart';
// import 'navigation_service.dart';

// class StudentListWidget extends StatefulWidget {
//   const StudentListWidget({super.key});

//   @override
//   State<StudentListWidget> createState() => _StudentListWidgetState();
// }

// class _StudentListWidgetState extends State<StudentListWidget> {
//   late final PageController _studentController;
//   late final PageController _headingController;
//   late double _currentPosition;
//   late int _currentHeading;

//   void _navigationListener() {
//     //set state called
//     setState(() {
//       _currentPosition = _studentController.page!;

//       if (_currentPosition.round() != _currentHeading) {
//         _currentHeading = _currentPosition.round();
//         _headingController.animateToPage(_currentHeading,
//             duration: const Duration(milliseconds: 50),
//             curve: Curves.bounceOut);
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _studentController = PageController(viewportFraction: 0.5, initialPage: 0);
//     _headingController = PageController(
//         viewportFraction: 1,
//         initialPage: CasianSeniours.listOfStudents.length - 1);
//     _currentPosition = _studentController.initialPage.toDouble();
//     _currentHeading = _headingController.initialPage;
//     _studentController.addListener(_navigationListener);
//   }

//   @override
//   void dispose() {
//     _studentController.removeListener(_navigationListener);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // IMAGES OF CASIANS
//         Transform.scale(
//           alignment: Alignment.bottomCenter,
//           scale: 2.3,
//           child: PageView.builder(
//               controller: _studentController,
//               itemCount: CasianSeniours.listOfStudents.length,
//               clipBehavior: Clip.none,
//               scrollDirection: Axis.vertical,
//               itemBuilder: (context, index) {
//                 if (index == 0) {
//                   // return const SizedBox.shrink();
//                 }
//                 // we need to know how much index is far from the current page to scale it
//                 final double distance = (_currentPosition - index + 1).abs();
//                 final isNotOnScreen = (_currentPosition - index + 1) > 0;
//                 final double scale =
//                     1 - distance * .345 * (isNotOnScreen ? 1 : -1);
//                 final double translateY = (1 - scale).abs() *
//                         MediaQuery.of(context).size.height /
//                         1.5 +
//                     20 * (distance - 1).clamp(0.0, 1);
//                 return Padding(
//                     padding: EdgeInsets.only(
//                         bottom: MediaQuery.of(context).size.height * .1),
//                     child: Transform(
//                       transform: Matrix4.identity()
//                         ..setEntry(3, 2, 0.001)
//                         ..translate(0.0, !isNotOnScreen ? 0.0 : translateY)
//                         ..scale(scale),
//                       alignment: Alignment.bottomCenter,
//                       child: LiabraryItem(index: index),
//                     ));
//               }),
//         ),

//         // TEXT FOR NAME OF CASIANS
//         Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               color: Colors.blue,
//               height: 60,
//               child: PageView.builder(
//                   controller: _headingController,
//                   itemCount: CasianSeniours.listOfStudents.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     final CasianSeniours item =
//                         CasianSeniours.listOfStudents[index];

//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 80),
//                       child: Center(
//                         child: FittedBox(
//                           child: Text(
//                             item.name,
//                             // style: titleStyle,
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'dart:math';

import 'package:flutter/material.dart';
import '../../FahadPage/model/Stories.dart';
import '../../FahadPage/model/holder.dart';
// import 'package:flutter_application_2/music_slide_animation/animated_list/student_model.dart'/;
import '../../FahadPage/rotate_student_image_container.dart/liabrary_item.dart';
// import 'package:flutter_application_2/screens/back_side_page.dart';
import '../../FahadPage/screens/first_page.dart';

// import 'navigation_service.dart';

class CasianAnimatedListPage extends StatefulWidget {
  const CasianAnimatedListPage({super.key});
  static const name = 'casianPage';

  @override
  State<CasianAnimatedListPage> createState() => _CasianAnimatedListPageState();
}

class _CasianAnimatedListPageState extends State<CasianAnimatedListPage> {
  late final PageController _studentController;
  late final PageController _headingController;
  late double _currentPosition;
  late int _currentHeading;

  void _navigationListener() {
    setState(() {
      _currentPosition = _studentController.page!;
      // print(_currentPosition);
      if (_currentPosition.round() != _currentHeading) {
        _currentHeading = _currentPosition.round();
        _headingController.animateToPage(_currentHeading,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _studentController = PageController(viewportFraction: 0.4, initialPage: 4);
    _headingController = PageController(viewportFraction: 1, initialPage: 4);
    _currentPosition = _studentController.initialPage.toDouble();
    _currentHeading = _headingController.initialPage;
    _studentController.addListener(_navigationListener);
  }

  @override
  void dispose() {
    _studentController.removeListener(_navigationListener);
    _studentController.dispose();
    _headingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ...........
          ..._buildBackground(),
          // ....FIRST STACK .... FOR ANIMATED LIST..................................

          Transform.scale(
            alignment: Alignment.bottomCenter,
            scale: 2.1,
            child: PageView.builder(
                controller: _studentController,
                itemCount: DataHolder.storiesList.length,
                clipBehavior: Clip.none,
                // scrollBehavior: WindowsScrollBehaviour(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // HEADINGS HERE Would be great
                    return const SizedBox.shrink();
                  }
                  // we need to know how much index is far from the current page to scale it
                  final double distance = (_currentPosition - index + 1).abs();
                  final isNotOnScreen = (_currentPosition - index + 1) > 0;
                  final double scale =
                      1 - distance * .345 * (isNotOnScreen ? 1 : -1);
                  final double translateY = (1 - scale).abs() *
                          MediaQuery.of(context).size.height /
                          1.5 +
                      20 * (distance - 1).clamp(0.0, 1);
                  return Container(
                    // width: 300,
                    decoration: BoxDecoration(
                        // color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: height * 0.205),
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..translate(0.0, !isNotOnScreen ? 0.0 : translateY)
                          ..scale(scale),
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          // width: 200,
                          // LIST PAGE OF CASIANS.................
                          child: FittedBox(child: LiabraryItem(index: index)),
                        ),
                      ),
                    ),
                  );
                }),
          ),

          // .SECOND STACK...........TEXT AT TOP FOR NAME OF CASIANS..........................
          // Container(
          //     height: height * 0.15,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         stops: [.6, 1],
          //         colors: [
          //           Color.fromARGB(255, 241, 238, 238),
          //           const Color.fromARGB(255, 44, 43, 43).withOpacity(0.0),
          //         ],
          //       ),
          //     ),
          //     // TOP TEXT NAME OF CASIANS
          //     child: ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.15,
                child: PageView.builder(
                    controller: _headingController,
                    itemCount: DataHolder.storiesList.length,

                    // scrollBehavior: WindowsScrollBehaviour(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final Stories item = DataHolder.storiesList[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Center(
                          child: Hero(
                            tag: "casian${item.name}_name",
                            child: SizedBox(
                              height: height * 0.05,
                              child: FittedBox(
                                child: Text(
                                  item.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          )
          // ............
          // ..._buildOverlays(),
          // .................
          // ..THIRD STACK........... LAST BUTTON FOR NAVIGAT TO HOME PAGE..................................
          // GestureDetector(
          //     onTap: () {
          //       Navigator.push(context, PageRouteBuilder(
          //         pageBuilder: (context, animation, secondaryAnimation) {
          //           return FadeTransition(
          //               opacity: animation,
          //               child: ScaleTransition(
          //                   scale: animation, child: First_page()));
          //         },
          //       ));
          //     },
          //     child: Padding(
          //       padding: EdgeInsets.all(30),
          //       child: Align(
          //         alignment: Alignment.bottomLeft,
          //         child: Container(
          //           // padding: EdgeInsets.all(30),
          //           width: width * 0.55,
          //           height: height * 0.08,
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(25),
          //               boxShadow: const [
          //                 BoxShadow(offset: Offset(2, 2), color: Colors.black38)
          //               ]),
          //           child: Row(
          //               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 SizedBox(
          //                     width: (width * 0.55) * 0.3,
          //                     child: const Icon(Icons.arrow_forward)),
          //                 SizedBox(
          //                     width: width * 0.25,
          //                     child: FittedBox(child: Text('Let,s Start')))
          //               ]),
          //         ),
          //       ),
          //     )
          //     // ..........
          //     )
        ],
      ),
    );
  }

  List<Widget> _buildBackground() {
    return [
      Align(
        alignment: Alignment.bottomCenter + const Alignment(0, .7),
        child: Container(
          width: MediaQuery.of(context).size.width * .5,
          height: MediaQuery.of(context).size.width * .5,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.brown,
              blurRadius: 90,
              spreadRadius: 90,
              offset: Offset.zero,
            ),
            BoxShadow(
              color: Colors.black38,
              blurRadius: 90,
              spreadRadius: 90,
              offset: Offset.zero,
            ),
          ], shape: BoxShape.circle),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft + const Alignment(-0.35, -.5),
        child: Container(
          width: 60,
          height: 200,
          decoration: const BoxDecoration(
            // color: kBrownColor,
            boxShadow: [
              BoxShadow(
                color: Colors.brown,
                blurRadius: 50,
                spreadRadius: 20,
                offset: Offset(5, 0),
              ),
            ],
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomRight + const Alignment(5.8, -0.45),
        child: const SizedBox(
            width: 350,
            height: 350,
            child: DecoratedBox(
              decoration: BoxDecoration(
                // color: kBrownColor,
                boxShadow: [
                  BoxShadow(
                    // color: kBrownColor.withOpacity(.4),
                    blurRadius: 60,
                    spreadRadius: 20,
                    offset: Offset(5, 0),
                  ),
                ],
                shape: BoxShape.circle,
              ),
            )),
      )
    ];
  }

  // ...................

  List<Widget> _buildOverlays() {
    return [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 115,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.brown, Colors.white10],
            ),
          ),
        ),
      )
    ];
  }
}
