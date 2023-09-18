import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardComponents/Header/Header/header_stack.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardComponents/InfoSection/info_section.dart';
import 'package:student_managmane_dashboard/ScreenSizes/screen_size.dart';
import '../DashboardComponents/CatagoryRow/catagory_row.dart';
import '../DashboardComponents/Drawer/Drawer/drawer.dart';

final _heightOfScreen = screenHeight;

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });
  static const name = 'dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                const HeaderStack(),
                const CategoryRow(
                  category: 'Information Section',
                ),
                SizedBox(height: _heightOfScreen * 0.015),
                // const InfoSectionGrip()
                const InfoSectionViewer(),
                SizedBox(
                  height: _heightOfScreen * 0.03,
                )
              ],
            ),
            const SideDrawer()
          ],
        ),
      ),
    );
  }
}
