import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';

class HeaderOfInstallmentDetails extends StatelessWidget {
  const HeaderOfInstallmentDetails({super.key});

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
                    image: AssetImage(
                        'assets/details_images/installment_detailss.jpg'),
                    fit: BoxFit.fill)),
            alignment: Alignment.center,
          ),
        ),
        Container(
            height: height * 0.22,
            width: width * 0.9,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                  color: secondaryColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: Colors.white.withOpacity(0.1)),
            child: const Text(
              'Installment Details',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
