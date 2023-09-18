import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';
import 'package:student_managmane_dashboard/ScreenSizes/screen_size.dart';

final _titleContainerWidth = screenWidth * 0.77;
final _itemHeight = screenHeight * 0.25;

class InfoSectionItem extends StatefulWidget {
  const InfoSectionItem(
      {super.key,
      required this.title,
      required this.imageSrc,
      required this.isCurrentPage});
  final String title;
  final String imageSrc;
  final bool isCurrentPage;
  @override
  State<InfoSectionItem> createState() => _InfoSectionItemState();
}

class _InfoSectionItemState extends State<InfoSectionItem>
    with SingleTickerProviderStateMixin {
  late AnimationController itemController;
  late Animation<double> itemShadeSizeAnimation;

  @override
  void initState() {
    super.initState();
    itemController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addListener(() {
            setState(() {});
          })
          ..forward();

    itemShadeSizeAnimation = Tween<double>(begin: 0.1, end: 0.4).animate(
        CurvedAnimation(
            parent: itemController, curve: const Interval(0.2, 0.4)));
  }

  @override
  void dispose() {
    itemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textSizeFactor = screenWidth * 0.35;

    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()
          ..translate(
            widget.isCurrentPage ? 0.0 : -20.0,
            widget.isCurrentPage ? 0.0 : 80.0,
          ),
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(0, 2),
              color: shadowsColor,
            ),
          ],
          image: DecorationImage(
            image: AssetImage(widget.imageSrc),
            fit: BoxFit.fill,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: GlassContainer(
            blur: 2,
            border: 0,
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
            child: Container(
              width: _titleContainerWidth,
              padding: EdgeInsets.only(top: _itemHeight * 0.03),
              height: _itemHeight * itemShadeSizeAnimation.value,
              decoration: const BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Text(widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: textSizeFactor * 0.15,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      shadows: const [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black38,
                          offset: Offset(3, 3),
                        )
                      ])),
            ),
          ),
        ));
  }
}
