import 'package:flutter/material.dart';
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
      // backgroundColor: Color.fromARGB(255, 214, 236, 254),
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
