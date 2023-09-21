import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';

class FrontWidget extends StatelessWidget {
  const FrontWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Stack(children: [
      ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
        child: Container(
          height: height * 0.22,
          width: width * 0.9,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              image: DecorationImage(
                  image: AssetImage(
                      'assets/details_images/fee_structure_image.jpg'),
                  fit: BoxFit.fill)),
        ),
      ),
      Container(
        height: height * 0.22,
        width: width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            color: secondaryColor,
          ),
          color: Colors.white.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        alignment: Alignment.center,
        child: const AutoSizeText(
          overflow: TextOverflow.ellipsis,
          'Fee Structure',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          softWrap: true,
        ),
      ),
      Positioned(
          left: width * 0.60,
          top: height * 0.17,
          child: Container(
            height: height * 0.06,
            width: width * 0.4,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                border: Border.all(
                  color: secondaryColor,
                )),
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 5),
              child: const Text(
                'Tab to Swap',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ))
    ]);
  }
}
