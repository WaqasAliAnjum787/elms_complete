import 'dart:ui';
import 'package:flutter/material.dart';

class FrontWidget extends StatelessWidget {
  const FrontWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Stack(children: [
      ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
        child: Container(
          height: height * 0.22,
          width: width * 0.9,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              image: DecorationImage(
                  image: AssetImage(
                      'assets/details_images/fee_structure_image.jpg'),
                  fit: BoxFit.fill)),
        ),
      ),
      Container(
        height: height * 0.22,
        width: width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 38, 64, 125),
          ),
          color: Colors.white.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        alignment: Alignment.center,
        child: const Text(
          'Fee Structure',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          softWrap: true,
        ),
      ),
      Positioned(
          left: width * 0.70,
          top: height * 0.17,
          child: Container(
            height: height * 0.1,
            width: width * 0.3,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.black,
                )),
            child: Padding(
              padding:
                  EdgeInsets.only(left: width * 0.012, top: height * 0.012),
              child: const FittedBox(child: Text('Tab to Swap')),
            ),
          ))
    ]);
  }
}
