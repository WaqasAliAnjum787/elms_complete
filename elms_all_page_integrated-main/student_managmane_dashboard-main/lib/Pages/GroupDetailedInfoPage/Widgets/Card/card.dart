import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardComponents/Header/HeaderComponent/GroupsInfoStack/groups_info_stack_comp.dart';
import 'package:student_managmane_dashboard/Pages/GroupDetailedInfoPage/Widgets/Card/card_column_widget.dart';
import 'package:student_managmane_dashboard/ScreenSizes/screen_size.dart';

final _groupsInfoItemHeight = screenHeight * 0.5;
final _groupsInfoItemWidth = screenWidth * 0.7;

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.groupName});
  final String groupName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _groupsInfoItemWidth,
      height: _groupsInfoItemHeight,
      decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: shadowsColor,
              blurRadius: 5,
            )
          ]),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          CardColumnWidget(groupName: groupName),
          GroupNameContainer(
            groupName: groupName,
          ),
        ],
      ),
    );
  }
}
