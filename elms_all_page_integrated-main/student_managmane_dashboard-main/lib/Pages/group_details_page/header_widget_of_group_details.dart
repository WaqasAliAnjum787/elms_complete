import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';

class HeaderWidgetOfGroupDetails extends StatelessWidget {
  const HeaderWidgetOfGroupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
          child: Container(
            height: height * 0.22,
            width: width * 0.9,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                image: DecorationImage(
                    image:
                        AssetImage('assets/details_images/group_details.jpg'),
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
            child: const AutoSizeText(
              overflow: TextOverflow.ellipsis,
              'Group Details',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
