import 'package:flutter/material.dart';

class TextDeatilAboutCasian extends StatelessWidget {
  const TextDeatilAboutCasian(
      {required this.name,
      required this.currentPosition,
      required this.companny,
      required this.width,
      required this.height,
      super.key});
  final double width;
  final double height;
  final String name;
  final String currentPosition;
  final String companny;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //.................................................................... NAME OF CASIAN STUDENT
          SizedBox(
              // width: width * 0.5,
              height: height * 0.1,
              // height: height * 0.1,
              child: FittedBox(
                  child: Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.w900),
              ))),

          SizedBox(
            height: height * 0.02,
          ),

          //.................................................................... CURRENT POSITION OF CASION STUDENT
          SizedBox(
              // width: width * 0.6,
              height: height * 0.1,
              child: FittedBox(child: Text(currentPosition))),
          // SizedBox(
          //   height: height * 0.02,
          // ),

          //.................................................................... COMPANNY OF CASIAN STUDENT

          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
              // width: width * 0.5,
              height: height * 0.1,
              child: FittedBox(child: Text(companny))),
          // SizedBox(
          //   height: height * 0.02,
          // ),

          // ................................................................... LINKDIN BUTTON
          SizedBox(
            height: height * 0.02,
          ),
          GestureDetector(
            //
            onTap: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Not Available ')));
            },
            //
            child: Align(
              // alignment: Alignment.center,
              child: Container(
                // width: width,
                height: height * 0.2,
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
