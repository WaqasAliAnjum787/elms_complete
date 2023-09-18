import 'package:flutter/material.dart';
import '../../../../../ScreenSizes/screen_size.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({super.key});
  static const bannerCornerRadius = 30.0;
  final Color bannerComponentsColor = Colors.white70;
  static const drawerSize = 43.0;

  @override
  Widget build(BuildContext context) {
    const imagePath = 'assets/images/banner.png';
    return Container(
        width: screenWidth,
        height: screenHeight * 0.35,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(bannerCornerRadius),
                bottomRight: Radius.circular(bannerCornerRadius)),
            image: DecorationImage(
                image: AssetImage(imagePath), fit: BoxFit.fill)),
        child: Padding(
          padding: EdgeInsets.only(
              top: screenHeight * 0.06, left: screenWidth * 0.07),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenWidth * 0.15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('CAS',
                      style: TextStyle(
                          color: bannerComponentsColor,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold)),
                  Text('Center for advance Studies',
                      style: TextStyle(
                          color: bannerComponentsColor,
                          fontSize: screenWidth * 0.035)),
                ],
              ),
            ],
          ),
        ));
  }
}
