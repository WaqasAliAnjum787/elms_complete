import 'package:flutter/material.dart';

import '../model/rotate_animation_holder_manager.dart';
import '../rotate_student_image_container.dart/image_wrapper.dart';

class CasianStudentDetail extends StatefulWidget {
  const CasianStudentDetail(
      {super.key,
      required this.routeAnimation,
      required this.image,
      required this.heroTag,
      required this.companny,
      required this.currentPosition,
      required this.linkdinUrl,
      required this.name});

  final Animation<double> routeAnimation;
  final String image;
  final String heroTag;
  // final String position;
  final String currentPosition;
  final String companny;
  final String linkdinUrl;
  final String name;

  @override
  State<CasianStudentDetail> createState() => _CasianStudentDetailState();
}

class _CasianStudentDetailState extends State<CasianStudentDetail> {
  late final Animation<double> appBarOffsetAnimation;
  late final Animation<Offset> contentOffsetAnimation;

  @override
  void initState() {
    appBarOffsetAnimation = Tween(begin: -100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: widget.routeAnimation,
        curve: const Interval(0.5, 1, curve: Curves.easeOut),
      ),
    );
    contentOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: widget.routeAnimation,
        curve: const Interval(0.5, 1, curve: Curves.easeOut),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // ................................................................... TOP Left Animated Icon
          AnimatedBuilder(
            animation: appBarOffsetAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, appBarOffsetAnimation.value),
                child: AppBar(),
              );
            },
          ),

          // ................................................................... Image FlirteLand Position
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: height * 0.35,
              width: width * 0.8,
              child: Hero(
                tag: widget.heroTag,
                child: Transform(
                  transform: AnimationManager.endTransformMatrix,
                  alignment: Alignment.center,
                  child: ImageWrapper(image: widget.image),
                ),
              ),
            ),
          ),

          SizedBox(
            height: height * 0.03,
          ),
          //.................................................................... NAME OF CASIAN STUDENT
          SizedBox(
              width: width * 0.5,
              // height: height * 0.1,
              child: FittedBox(
                  child: Text(
                widget.name,
                style: const TextStyle(fontWeight: FontWeight.w900),
              ))),

          SizedBox(
            height: height * 0.02,
          ),

          //.................................................................... CURRENT POSITION OF CASION STUDENT
          SizedBox(
              width: width * 0.6,
              child: FittedBox(child: Text(widget.currentPosition))),
          // SizedBox(
          //   height: height * 0.02,
          // ),

          //.................................................................... COMPANNY OF CASIAN STUDENT
          SizedBox(
              width: width * 0.5,
              child: FittedBox(child: Text(widget.companny))),
          // SizedBox(
          //   height: height * 0.02,
          // ),

          // ................................................................... LINKDIN BUTTON
          GestureDetector(
            //
            onTap: () {},
            //
            child: Align(
              // alignment: Alignment.center,
              child: Container(
                width: width,
                // height: height * 0.35,
                // color: Colors.amber,

                // ROW IN CONTAINER
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ICON IN BTN CONTAINER
                    SizedBox(
                      width: width * 0.12,
                      child: const FittedBox(
                        child: Icon(
                          Icons.link_outlined,
                          color: Colors.purple,
                        ),
                      ),
                    ),

                    // TEXT IN BTN CONTAINER
                    SizedBox(
                      width: width * 0.2,
                      child: const FittedBox(
                        child: Text(
                          'Linkdin',
                          style: TextStyle(
                              color: Colors.purple,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
