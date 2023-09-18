import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardComponents/Header/HeaderComponent/banner.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardComponents/Header/HeaderComponent/GroupsInfoStack/groups_info_stack.dart';
import 'package:student_managmane_dashboard/ScreenSizes/screen_size.dart';

final _stackHeight = screenHeight * 0.55;

class HeaderStack extends StatelessWidget {
  const HeaderStack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.52,
      child: const Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          TopBanner(),
          GroupsInfoStack(),
        ],
      ),
    );
  }
}
