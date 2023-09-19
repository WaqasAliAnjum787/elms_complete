import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/leaves_page/my_leaves/leave_detail_page/leave_detail_item.dart';

class AnimateAbleItem extends StatelessWidget {
  const AnimateAbleItem(
      {super.key,
      required this.animation,
      required this.leftSide,
      required this.rightSide});
  final Animation<double> animation;
  final String leftSide;
  final String rightSide;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: ScaleTransition(
            scale: animation,
            child: LeaveDetailItem(
              leftSide: leftSide,
              rightSide: rightSide,
            )),
      ),
    );
  }
}
