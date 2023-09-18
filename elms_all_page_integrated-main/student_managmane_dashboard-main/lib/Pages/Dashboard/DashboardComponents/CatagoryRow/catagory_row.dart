import 'package:flutter/material.dart';

import '../../../../Colors/theme_colors.dart';
import '../../../../ScreenSizes/screen_size.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.07,
        ),
        Text(
          category,
          style: TextStyle(
              color: secondaryColor,
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
