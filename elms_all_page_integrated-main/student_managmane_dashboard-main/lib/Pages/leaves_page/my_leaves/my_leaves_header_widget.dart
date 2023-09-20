import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';

class MyLeavesHeaderWidget extends StatelessWidget {
  const MyLeavesHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width * 0.9,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
              child: Container(
                height: height * 0.22,
                width: width * 0.85,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/my_leaves/images/my_leaves_image.jpg'),
                        fit: BoxFit.fill)),
              ),
            ),
            Container(
                height: height * 0.22,
                width: width * 0.9,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: secondaryColor),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: Colors.white.withOpacity(0.3)),
                child: const Text(
                  'My Leaves',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
