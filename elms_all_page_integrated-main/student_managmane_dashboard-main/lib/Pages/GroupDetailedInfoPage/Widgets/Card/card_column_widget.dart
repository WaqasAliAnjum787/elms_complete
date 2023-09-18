import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardComponents/Header/HeaderComponent/GroupsInfoStack/groups_info_stack_comp.dart';
import 'package:student_managmane_dashboard/ScreenSizes/screen_size.dart';

// Container size
final _groupInfoContainerWidth = screenWidth * 0.85;
final _groupInfoContainerHeight = screenHeight * 0.35;

class CardColumnWidget extends StatelessWidget {
  const CardColumnWidget({super.key, required this.groupName});
  final String groupName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: _groupInfoContainerWidth,
        height: _groupInfoContainerHeight,
        child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.08, top: screenHeight * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingText(title: 'Group Details'),
              SizedBox(
                height: screenHeight * 0.06,
              ),
              const HeadingText(title: 'Mentor'),
              Padding(
                  padding:
                      EdgeInsets.only(left: _groupInfoContainerWidth * 0.12),
                  child: const ContentText(title: 'Noman Ameer Khan')),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              const HeadingText(title: 'Group Name'),
              Padding(
                  padding:
                      EdgeInsets.only(left: _groupInfoContainerWidth * 0.12),
                  child: ContentText(title: groupName)),
            ],
          ),
        ));
  }
}
