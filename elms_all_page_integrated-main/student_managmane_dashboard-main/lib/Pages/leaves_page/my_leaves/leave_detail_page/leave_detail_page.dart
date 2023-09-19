import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/leaves_page/my_leaves/leave_detail_page/header_of_leave_detail.dart';
import 'package:student_managmane_dashboard/Pages/leaves_page/my_leaves/leave_detail_page/leave_description.dart';
import 'package:student_managmane_dashboard/Pages/leaves_page/my_leaves/leave_detail_page/leave_detail_item.dart';

class LeaveDetailPage extends StatefulWidget {
  const LeaveDetailPage({super.key});
  static const String name = "leaveDetailPage";

  @override
  State<LeaveDetailPage> createState() => _LeaveDetailPageState();
}

class _LeaveDetailPageState extends State<LeaveDetailPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> topFirst;
  late Animation<double> topSecond;
  late Animation<double> topThird;
  late Animation<double> topFourth;
  late Animation<double> topFifth;
  late Animation<double> topSixth;
  late Animation<double> topSeventh;
  late Animation<double> topEight;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    topFirst = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.12, curve: Curves.easeInBack)));

    topSecond = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.22, curve: Curves.easeInBack)));

    topThird = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.32, curve: Curves.easeInBack)));

    topFourth = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.42, curve: Curves.easeInBack)));

    topFifth = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.52, curve: Curves.easeInBack)));

    topSixth = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.62, curve: Curves.easeInBack)));

    topSeventh = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.82, curve: Curves.easeInBack)));

    topEight = Tween<double>(begin: 0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 1.0, curve: Curves.easeInBack)));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Stack(alignment: Alignment.center, children: [
          Positioned(top: height * 0.01, child: const HeaderOfLeaveDetail()),
          Positioned(
            top: height * 0.25,
            left: width * 0.05,
            child: SizedBox(
                height: height * 0.75,
                width: width,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimateAbleItem(
                            animation: topFirst,
                            leftSide: 'From Date',
                            rightSide: '10-12-2023'),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        AnimateAbleItem(
                            animation: topSecond,
                            leftSide: 'To Date',
                            rightSide: '20-12-2023'),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        AnimateAbleItem(
                            animation: topThird,
                            leftSide: 'No of Days',
                            rightSide: '10000'),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        AnimateAbleItem(
                            animation: topFourth,
                            leftSide: 'Name',
                            rightSide: 'Waqas Ali Anjum'),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        AnimateAbleItem(
                            animation: topFifth,
                            leftSide: 'Status',
                            rightSide: 'Approved'),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        AnimateAbleItem(
                            animation: topSixth,
                            leftSide: 'Section',
                            rightSide: 'F11'),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        AnimateAbleItem(
                            animation: topSeventh,
                            leftSide: 'Apply Date',
                            rightSide: '10-12-2023'),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        LeaveDescription(
                          animation: topEight,
                          leaveDescription:
                              "Here will be the leave description",
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                      ]),
                )),
          )
        ])),
      ),
    );
  }
}

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
