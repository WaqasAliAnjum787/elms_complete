import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/FahadPage/screens/FirstPage/FirstPageWidgets/FrontSide/FontWidgets/chooserule.dart';
import '../../../SuccessCasiansAnimatedListPage/casian_animated_list.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../CasianCoursesPage/courses_offer.dart';

class FrontSideOfFirstPage extends StatefulWidget {
  const FrontSideOfFirstPage({super.key});

  @override
  State<FrontSideOfFirstPage> createState() => _FrontSideOfFirstPageState();
}

class _FrontSideOfFirstPageState extends State<FrontSideOfFirstPage>
    with TickerProviderStateMixin {
  // final String casLogoTag = 'cas-logo';

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

  // onTapOnLinkdin() {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('LinkDin Profile Not Available')));
  // }

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
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          // SizedBox(
          //   height: height * 0.04,
          // ),
          FittedBox(
            child: Text(
              'Well Come',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: height * 0.027,
                  fontWeight: FontWeight.bold),
            ),
          ),

          // SizedBox(
          //   height: height * 0.04,
          // ),
          // ............................................................... SLIDER FOR IMAGES
          // FanCarouselImageSlider(
          //     isClickable: false,
          //     expandedImageFitMode: BoxFit.fill,
          //     indicatorActiveColor: Colors.blue,
          //     isAssets: true,
          //     imageRadius: 2,
          //     imagesLink: DataHolder.ImageListForWorkShop,
          //     sliderHeight: height * 0.3),

          // ................................................................. TOP ICON FOR POP THE SCREEN

          // Stack(children: [
          // Container(
          //   height: height * 0.2,
          //   width: width,

          //   // color: Colors.amber,
          //   child: Center(
          //     child: Image.asset(
          //       'assets/images/caslogo.png',
          //     ),
          //   ),
          // ),

          // /////
          CarousalAnimation(),
          // ////
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

          // SizedBox(
          //   height: height * 0.04,
          // ),
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

          // SizedBox(
          //   height: height * 0.02,
          // ),
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
          // SizedBox(
          //   height: height * 0.02,
          // ),

          // SizedBox(
          //   height: height * 0.04,
          // ),
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
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
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
          // SizedBox(
          //   height: height * 0.02,
          // ),
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
                      child: const Icon(Icons.phone, color: Colors.green),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
