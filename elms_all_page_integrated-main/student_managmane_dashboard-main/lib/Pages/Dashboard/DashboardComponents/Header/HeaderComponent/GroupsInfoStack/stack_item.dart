import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import '../../../../../../Colors/theme_colors.dart';
import '../../../../../../ScreenSizes/screen_size.dart';
import 'groups_info_stack_comp.dart';

final _groupsInfoItemHeight = screenHeight * 0.3;

class GroupsInfoItem extends StatelessWidget {
  const GroupsInfoItem(
      {super.key,
      required this.groupsInfoItemWidth,
      required this.onTap,
      required this.noOfCards,
      required this.cardOnTap,
      required this.groupName});
  final double groupsInfoItemWidth;
  final GestureTapCallback onTap;
  final int noOfCards;
  final GestureTapCallback cardOnTap;
  final String groupName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardOnTap,
      child: Container(
        width: groupsInfoItemWidth,
        height: _groupsInfoItemHeight,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: shadowsColor,
                blurRadius: 5,
              )
            ]),
        child: GlassContainer(
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              InfoColumn(
                  onTap: onTap, noOfCards: noOfCards, groupName: groupName),
              GroupNameContainer(
                groupName: groupName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
