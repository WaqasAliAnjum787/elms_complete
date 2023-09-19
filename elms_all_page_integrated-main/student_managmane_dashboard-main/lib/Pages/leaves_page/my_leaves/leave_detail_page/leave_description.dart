import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';

class LeaveDescription extends StatelessWidget {
  const LeaveDescription(
      {super.key, required this.animation, required this.leaveDescription});
  final Animation<double> animation;
  final String leaveDescription;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: ScaleTransition(
            scale: animation,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  useSafeArea: true,
                  builder: (context) {
                    return LeaveDescriptionDialog(
                        leaveDescription: leaveDescription);
                  },
                );
              },
              child: Container(
                height: height * 0.12,
                width: width * 0.9,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text(
                  'Leave Description',
                  style:
                      TextStyle(color: Colors.white, fontSize: height * 0.030),
                ),
              ),
            )),
      ),
    );
  }
}

class LeaveDescriptionDialog extends StatelessWidget {
  const LeaveDescriptionDialog({super.key, required this.leaveDescription});
  final String leaveDescription;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Dialog(
        child: Container(
      height: height * 0.6,
      width: width * 0.8,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          width: width * 0.8,
          height: height * 0.1,
          decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Text('Leave Description',
              style: TextStyle(
                  fontSize: height * 0.030, fontWeight: FontWeight.bold)),
        ),
        SingleChildScrollView(
          child: Container(
            height: height * 0.5,
            width: width * 0.8,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Text(leaveDescription),
          ),
        )
      ]),
    ));
    ;
  }
}
