import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:student_managmane_dashboard/Colors/theme_colors.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardComponents/Drawer/DrawerComponents/drawer_helper.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardComponents/Drawer/DrawerComponents/drawer_item_modal.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardComponents/Drawer/DrawerComponents/item.dart';
import 'package:student_managmane_dashboard/ScreenSizes/screen_size.dart';

import '../Clipper/clipper.dart';
// Drawer button size

final double _heightOfScreen = screenHeight;
final double _widthOfScreen = screenWidth;

class SideDrawer extends StatefulWidget {
  const SideDrawer({
    super.key,
  });

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _itemsOpacityAnimation;
  late Animation<double> _horizontalAlignAnimation;
  late Animation<double> _verticalAlignAnimation;
  late Animation<double> _iconAnimation;
  late Animation<double> _radiusAnimation;

  DrawerHelper helper = DrawerHelper();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0, 0.7)));
    _horizontalAlignAnimation = Tween<double>(begin: -0.9, end: -1).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0, 0.7)));
    _verticalAlignAnimation = Tween<double>(begin: -0.9, end: -0.55).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0, 0.7)));

    _widthAnimation =
        Tween<double>(begin: screenWidth * 0.12, end: screenWidth * 0.8)
            .animate(CurvedAnimation(
                parent: _animationController, curve: const Interval(0, 0.7)));
    _heightAnimation =
        Tween<double>(begin: screenHeight * 0.07, end: screenHeight * 0.6)
            .animate(CurvedAnimation(
                parent: _animationController, curve: const Interval(0, 0.7)));
    _iconAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0, 0.7)));
    _radiusAnimation = Tween<double>(begin: 10, end: 0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0, 0.7)));
    _itemsOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.75, 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: _heightOfScreen * 0.06, left: _widthOfScreen * 0.07),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Align(
            alignment: Alignment(
                _horizontalAlignAnimation.value, _verticalAlignAnimation.value),
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: ClipPath(
                clipper: DrawerClipper(),
                child: Container(
                  alignment: Alignment.center,
                  width: _widthAnimation.value,
                  height: _heightAnimation.value,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 5,
                          offset: Offset(2, 2),
                        )
                      ],
                      color: const Color.fromARGB(200, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20)),
                  child: GlassContainer(
                    blur: 2,
                    child: Opacity(
                      opacity: _itemsOpacityAnimation.value,
                      child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.1),
                          child: ListView.builder(
                              padding: EdgeInsets.only(top: screenHeight * 0.1),
                              itemExtent: screenHeight * 0.08,
                              itemCount: helper.items.length,
                              itemBuilder: itemBuulder)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (_animationController.status == AnimationStatus.completed) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: _widthOfScreen * 0.12,
              height: _heightOfScreen * 0.06,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10),
                      topRight: Radius.circular(_radiusAnimation.value),
                      bottomLeft: Radius.circular(_radiusAnimation.value),
                      bottomRight: Radius.circular(_radiusAnimation.value))),
              child: AnimatedIcon(
                  color: primaryColor,
                  icon: AnimatedIcons.menu_close,
                  size: 30,
                  progress: _iconAnimation),
            ),
          )
        ],
      ),
    );
  }

  Widget? itemBuulder(BuildContext context, int index) {
    DrawerItemModal item = helper.items[index];
    return DrawerItem(
      icon: item.icon,
      title: item.title,
    );
  }
}
