import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';
import 'package:student_managmane_dashboard/Pages/GroupDetailedInfoPage/Widgets/Card/card.dart';
import 'package:student_managmane_dashboard/ScreenSizes/screen_size.dart';

class GroupInfoPage extends StatelessWidget {
  const GroupInfoPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        backgroundColor: primaryColor,
        body: Align(
          alignment: Alignment.topRight,
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.07),
              InfoCard(
                groupName: title,
              )
            ],
          ),
        ));
  }
}
