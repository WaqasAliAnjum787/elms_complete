import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';
import 'package:student_managmane_dashboard/ScreenSizes/screen_size.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: secondaryColor,
          size: screenWidth * 0.065,
        ),
        SizedBox(
          width: screenWidth * 0.05,
        ),
        Text(
          title,
          style: TextStyle(
            color: secondaryColor,
            fontSize: screenWidth * 0.05,
          ),
        )
      ],
    );
  }
}
