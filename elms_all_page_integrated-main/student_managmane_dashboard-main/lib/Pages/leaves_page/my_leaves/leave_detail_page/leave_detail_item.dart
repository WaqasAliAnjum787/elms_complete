import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';
import 'package:student_managmane_dashboard/Pages/fee_structure/installment_detail_page/installment_detail_item_clipper.dart';

class LeaveDetailItem extends StatelessWidget {
  const LeaveDetailItem(
      {super.key, required this.leftSide, required this.rightSide});
  final String leftSide;
  final String rightSide;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
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
        ),
        Positioned(
            child: ClipPath(
          clipper: InstallmentDetailFirstClipper(),
          child: Container(
            height: height * 0.12,
            width: width * 0.4,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.only(right: width * 0.19, left: width * 0.02),
              child: AutoSizeText(
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: width * 0.045),
                leftSide,
              ),
            ),
          ),
        )),
        Positioned(
            left: width * 0.55,
            child: ClipPath(
              clipper: InstallmentDetailsSecondClipper(),
              child: Container(
                alignment: Alignment.center,
                height: height * 0.12,
                width: width * 0.35,
                decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: AutoSizeText(
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.048),
                    rightSide),
              ),
            ))
      ]),
    );
  }
}
