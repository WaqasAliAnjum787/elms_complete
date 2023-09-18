import 'package:flutter/material.dart';
// import 'package:glassmorphism/glassmorphism.dart';
// import 'package:student_managment_app_screens/Extra/Clipe_the_Workshop_container.dart';

import 'Extra/Clipe_the_Workshop_container.dart';

class WorkShopCards extends StatelessWidget {
  const WorkShopCards(
      {required this.text,
      required this.imageUrl,
      required this.linearGradient,
      super.key});
  final LinearGradient linearGradient;
  final String imageUrl;
  final String text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Padding(
        padding: EdgeInsets.only(
            right: width * 0.016,
            left: width * 0.016,
            top: height * 0.008,
            bottom: height * 0.008),
        // padding: EdgeInsets.all(0),
        child: ClipPath(
          clipper: ClipWorkShopContainer(),
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Focus on $text')));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(height * 0.02)),
                  gradient: linearGradient),
            ),
          ),
        ),
      ),
      // SECOND STACK IMAGE
      Container(
          // width: width * 0.21,
          width: width * 0.3,
          height: height * 0.08,
          // color: Colors.amber,
          child: Align(
              alignment: Alignment.topCenter, child: Image.asset(imageUrl))),
      // Align(
      //   // alignment: Alignment.topCenter,
      //   alignment: Alignment(-0.7, -1),
      //   child: Container(
      //     // color: Colors.amber,
      //     child: GlassmorphicContainer(
      //       width: width * 0.2,
      //       height: height * 0.09,
      //       borderRadius: 100,
      //       linearGradient: LinearGradient(colors: [
      //         Color.fromARGB(155, 255, 255, 255),
      //         const Color.fromARGB(80, 255, 255, 255)
      //       ]),
      //       border: 0,
      //       blur: 5,
      //       borderGradient: LinearGradient(colors: [
      //         Color.fromARGB(15, 238, 227, 227),
      //         Color.fromARGB(19, 78, 78, 78)
      //       ]),
      //       // shape: BoxShape.circle,
      //       child: Align(
      //           alignment: Alignment.center,
      //           child: Image.asset('assets/images/caslogo.png')),
      //     ),
      //   ),
      // )
    ]);
  }
}
