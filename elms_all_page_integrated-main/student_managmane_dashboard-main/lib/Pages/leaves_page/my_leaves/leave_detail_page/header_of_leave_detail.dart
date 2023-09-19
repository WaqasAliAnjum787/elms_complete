import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';

class HeaderOfLeaveDetail extends StatelessWidget {
  const HeaderOfLeaveDetail({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
          child: Container(
            height: height * 0.22,
            width: width * 0.9,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                image: DecorationImage(
                    image:
                        AssetImage('assets/my_leaves/images/leave_details.jpg'),
                    fit: BoxFit.fill)),
            alignment: Alignment.center,
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
              'Leave Details',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
