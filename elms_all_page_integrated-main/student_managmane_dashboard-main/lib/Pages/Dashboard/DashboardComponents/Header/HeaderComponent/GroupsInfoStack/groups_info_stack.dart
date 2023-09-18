import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardComponents/Header/HeaderComponent/GroupsInfoStack/stack_item.dart';
import 'package:student_managmane_dashboard/Pages/GroupDetailedInfoPage/group_detailed_info_page.dart';
import 'package:student_managmane_dashboard/ScreenSizes/screen_size.dart';

final _groupsInfoItemWidth = screenWidth * 0.85;
final _groupsInfoItemHeight = screenHeight * 0.37;
final _groupsInfoItemTopMargin = screenHeight * 0.15;

class GroupsInfoStack extends StatefulWidget {
  const GroupsInfoStack({
    super.key,
  });

  @override
  State<GroupsInfoStack> createState() => _GroupsInfoStackState();
}

class _GroupsInfoStackState extends State<GroupsInfoStack>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> cardTopPositionAnimation;
  late Animation<double> cardPerspectiveAnimation;
  late Animation<double> firstCardTopPositionAnimation;

  List<String> enrolledGroupList = ['F11', 'F12', 'F8'];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        setState(() {});
      });
    cardTopPositionAnimation =
        Tween<double>(begin: 0.03, end: 0.17).animate(controller);
    firstCardTopPositionAnimation =
        Tween<double>(begin: 0, end: -0.03).animate(controller);
    cardPerspectiveAnimation =
        Tween<double>(begin: 0, end: 0.0005).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    assert(enrolledGroupList.length <= 3, 'Maximum 3 cards allowed!');
    return Positioned(
      top: _groupsInfoItemTopMargin,
      child: SizedBox(
        width: _groupsInfoItemWidth,
        height: _groupsInfoItemHeight,
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            for (int i = 0, j = enrolledGroupList.length;
                i < enrolledGroupList.length;
                i++, j--)
              Positioned(
                  top: (i == 0
                      ? _groupsInfoItemHeight *
                          firstCardTopPositionAnimation.value
                      : (i *
                          _groupsInfoItemHeight *
                          cardTopPositionAnimation.value)),
                  child: Transform(
                      origin: Offset(screenWidth * 0.8 * 0.5, 0),
                      transform: Matrix4.identity()
                        ..setEntry(3, 1, cardPerspectiveAnimation.value),
                      child: GroupsInfoItem(
                        groupName: enrolledGroupList[i],
                        cardOnTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                settings: RouteSettings(
                                    arguments: enrolledGroupList[i]),
                                builder: (context) => const GroupInfoPage(),
                              ));
                        },
                        noOfCards: enrolledGroupList.length,
                        onTap: () {
                          if (controller.status == AnimationStatus.completed) {
                            controller.reverse();
                          } else {
                            controller.forward();
                          }
                        },
                        groupsInfoItemWidth: _groupsInfoItemWidth -
                            (j * _groupsInfoItemWidth * 0.05),
                      )))
          ],
        ),
      ),
    );
  }
}
