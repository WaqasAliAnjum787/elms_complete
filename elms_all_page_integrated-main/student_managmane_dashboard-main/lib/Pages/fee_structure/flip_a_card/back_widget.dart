import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';

class BackWidget extends StatelessWidget {
  const BackWidget(
      {super.key, required this.noOfInstallments, required this.totalAmount});
  final int noOfInstallments;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      alignment: Alignment.center,
      height: height * 0.22,
      width: width * 0.9,
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              height: height * 0.08,
              width: width * 0.35,
              child: const AutoSizeText(
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                  "Total Amount"),
            ),
            Container(
              alignment: Alignment.center,
              height: height * 0.08,
              width: width * 0.35,
              child: AutoSizeText(
                overflow: TextOverflow.ellipsis,
                totalAmount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              height: height * 0.08,
              width: width * 0.35,
              child: const AutoSizeText(
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                  "Installments"),
            ),
            Container(
              alignment: Alignment.center,
              height: height * 0.08,
              width: width * 0.35,
              child: AutoSizeText(
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                noOfInstallments.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
