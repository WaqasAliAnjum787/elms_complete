import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';
import 'package:student_managmane_dashboard/ScreenSizes/screen_size.dart';

// Container size
final _groupInfoContainerWidth = screenWidth * 0.85;
final _groupInfoContainerHeight = screenHeight * 0.35;

// Heading Text

class HeadingText extends StatelessWidget {
  const HeadingText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize:
              screenWidth * (title.endsWith('Group Details') ? 0.055 : 0.045),
          color: secondaryColor,
          fontWeight: FontWeight.bold),
    );
  }
}

// Content Text
class ContentText extends StatelessWidget {
  const ContentText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: screenWidth * 0.04,
          color: secondaryColor,
          fontWeight: FontWeight.w500),
    );
  }
}

// Info column
class InfoColumn extends StatelessWidget {
  const InfoColumn(
      {super.key,
      required this.onTap,
      required this.noOfCards,
      required this.groupName});
  final GestureTapCallback onTap;
  final int noOfCards;
  final String groupName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _groupInfoContainerWidth,
      height: _groupInfoContainerHeight,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.08, top: screenHeight * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadingText(title: 'Group Details'),
                SizedBox(
                  height: screenHeight * 0.06,
                ),
                Padding(
                    padding:
                        EdgeInsets.only(left: _groupInfoContainerWidth * 0.12),
                    child: const HeadingText(title: 'Mentor')),
                Padding(
                    padding:
                        EdgeInsets.only(left: _groupInfoContainerWidth * 0.23),
                    child: const ContentText(title: 'Noman Ameer Khan')),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: _groupInfoContainerWidth * 0.12),
                  child: const HeadingText(title: 'Group Name'),
                ),
                Padding(
                    padding:
                        EdgeInsets.only(left: _groupInfoContainerWidth * 0.23),
                    child: ContentText(title: groupName)),
              ],
            ),
          ),
          noOfCards > 1
              ? Positioned(
                  right: _groupInfoContainerWidth * 0.1,
                  bottom: _groupInfoContainerHeight * 0.13,
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: EdgeInsets.all(_groupInfoContainerHeight * 0.02),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                          boxShadow: [
                            BoxShadow(color: shadowsColor, blurRadius: 3)
                          ]),
                      child: Icon(
                        Icons.touch_app,
                        color: secondaryColor,
                        size: _groupInfoContainerHeight * 0.1,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

// Stacked Container
class GroupNameContainer extends StatefulWidget {
  const GroupNameContainer({super.key, required this.groupName});

  final String groupName;

  @override
  State<GroupNameContainer> createState() => _GroupNameContainerState();
}

class _GroupNameContainerState extends State<GroupNameContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  late Animation<double> innerSizeAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..addListener(() {
        setState(() {});
      })
      ..forward();
    sizeAnimation = Tween<double>(begin: 0, end: 0.3)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));
    innerSizeAnimation = Tween<double>(begin: 0, end: 0.2)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: _groupInfoContainerWidth * 0.1,
      child: Container(
        alignment: Alignment.center,
        width: _groupInfoContainerWidth * 0.17,
        height: _groupInfoContainerHeight * sizeAnimation.value,
        decoration: const BoxDecoration(
            color: secondaryColor,
            boxShadow: [
              BoxShadow(
                  color: shadowsColor, blurRadius: 5, offset: Offset(0, 3))
            ],
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(360))),
        child: Container(
          alignment: Alignment.center,
          width: _groupInfoContainerWidth * 0.1,
          height: _groupInfoContainerHeight * innerSizeAnimation.value,
          decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(360))),
          child: Text(
            widget.groupName,
            style: const TextStyle(
                color: secondaryColor, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
