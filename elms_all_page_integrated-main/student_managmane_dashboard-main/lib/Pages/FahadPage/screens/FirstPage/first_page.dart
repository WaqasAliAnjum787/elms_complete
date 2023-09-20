import 'package:flutter/material.dart';

import 'FirstPageWidgets/AnimatedBackGround/animated_back_side_page.dart';

import 'FirstPageWidgets/FrontSide/front_Side_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  static const name = 'firstPage';

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // double width = size.width;
    // double height = size.height;

    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      // backgroundColor: Colors.blue,
      // backgroundColor: Colors.tealAccent,
      body: SafeArea(
        child: Stack(
          children: [
            // ......
            // AnimatedBackGround(),

            // ......
            FrontSideOfFirstPage(),

            // ......
          ],
        ),
      ),
    );
  }
}
