import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';
import 'package:student_managmane_dashboard/helper_comp/crad_clipper.dart';

class GroupDetailListItem extends StatelessWidget {
  const GroupDetailListItem(
      {super.key, required this.leftSide, required this.rightSide});

  final String leftSide;
  final String rightSide;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Stack(children: [
        Container(
          height: height * 0.12,
          width: width * 0.9,
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 2, color: Colors.grey, offset: Offset(1, 1))
              ],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: const Padding(
            padding: EdgeInsets.only(bottom: 15),
          ),
        ),
        ClipPath(
          clipper: CardClipper(),
          child: Container(
            alignment: Alignment.center,
            height: height * 0.12,
            width: width * 0.3,
            decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Padding(
                padding: EdgeInsets.only(right: width * 0.04),
                child: AutoSizeText(
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  leftSide,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: width * 0.26,
          top: height * 0.03,
          child: Container(
            height: height * 0.06,
            width: width * 0.06,
            decoration: const BoxDecoration(
              color: secondaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
            left: width * 0.50,
            child: Container(
              height: height * 0.12,
              width: width * 0.40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(width * 0.12),
                      topLeft: Radius.circular(width * 0.12),
                      topRight: const Radius.circular(20),
                      bottomRight: const Radius.circular(20))),
              child: Container(
                height: height * 0.12,
                width: width * 0.32,
                alignment: Alignment.center,
                child: AutoSizeText(
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  rightSide,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
                ),
              ),
            )),
        Positioned(
            left: width * 0.255,
            top: height * 0.05,
            child: Container(
              alignment: Alignment.center,
              height: height * 0.02,
              width: width * 0.07,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ))
      ]),
    );
  }
}
