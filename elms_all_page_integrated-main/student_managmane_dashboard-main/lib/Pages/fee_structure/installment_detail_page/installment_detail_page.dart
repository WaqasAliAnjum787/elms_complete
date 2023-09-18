import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/fee_structure/installment_detail_page/header_of_installment_detail.dart';
import 'package:student_managmane_dashboard/Pages/fee_structure/installment_detail_page/installment_detail_item.dart';

class InstallmentDetailPage extends StatefulWidget {
  const InstallmentDetailPage({super.key});

  @override
  State<InstallmentDetailPage> createState() => _InstallmentDetailPageState();
}

class _InstallmentDetailPageState extends State<InstallmentDetailPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> topFirst;
  late Animation<double> topSecond;
  late Animation<double> topThird;
  late Animation<double> topFourth;
  late Animation<double> topFifth;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    topFirst = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.2, curve: Curves.easeInBack)));

    topSecond = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.4, curve: Curves.easeInBack)));

    topThird = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.6, curve: Curves.easeInBack)));

    topFourth = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.8, curve: Curves.easeInBack)));

    topFifth = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
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
          Positioned(
              top: height * 0.01, child: const HeaderOfInstallmentDetails()),
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
                            leftSide: 'Installment No',
                            rightSide: '1'),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        AnimateAbleItem(
                            animation: topSecond,
                            leftSide: 'Installment Amount',
                            rightSide: '10000.0'),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        AnimateAbleItem(
                            animation: topThird,
                            leftSide: 'Paid Amount',
                            rightSide: '10000.0'),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        AnimateAbleItem(
                            animation: topFourth,
                            leftSide: 'Date',
                            rightSide: '2022-10-10'),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        AnimateAbleItem(
                            animation: topFifth,
                            leftSide: 'Status',
                            rightSide: 'Paid'),
                        SizedBox(
                          height: height * 0.04,
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
            child: InstallmentDetailItem(
              leftSide: leftSide,
              rightSide: rightSide,
            )),
      ),
    );
  }
}
