import 'package:flutter/material.dart';

import 'animated_back_side_page.dart';

import 'front_Side_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  static const name = 'firstPage';

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // double width = size.width;
    // double height = size.height;

    return const Scaffold(
      backgroundColor: Color.fromARGB(250, 21, 18, 46),
      // backgroundColor: Colors.teal.shade100,
      body: SafeArea(
        child: Stack(
          children: [
            // ......
            AnimatedBackGround(),

            // ......
            FrontSideOfFirstPage(),

            // ......
          ],
        ),
      ),
    );
  }
}
