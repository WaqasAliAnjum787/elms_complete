import 'package:flutter/cupertino.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardPage/dashboard_page.dart';
import 'package:student_managmane_dashboard/Pages/FahadPage/screens/casian_animated_list.dart';
import 'package:student_managmane_dashboard/Pages/FahadPage/screens/first_page.dart';
import 'package:student_managmane_dashboard/Pages/SplashScreen/flow/Dating_main_screen/view/dating_main_screen.dart';
import 'package:student_managmane_dashboard/Pages/fee_structure/fee_structure_page.dart';
import 'package:student_managmane_dashboard/Pages/group_details_page/group_details_page.dart';
import 'package:student_managmane_dashboard/Pages/leaves_page/my_leaves/leave_detail_page/leave_detail_page.dart';
import 'package:student_managmane_dashboard/Pages/leaves_page/my_leaves/my_leaves_page.dart';
import 'package:student_managmane_dashboard/Pages/login_page/login_page.dart';

Route? onGenerateRout(RouteSettings settings) {
  if (settings.name == SplashScreen.name) {
    return CupertinoPageRoute(builder: splashScreenBuilder);
  } else if (settings.name == Dashboard.name) {
    return CupertinoPageRoute(builder: dashboardBuilder);
  } else if (settings.name == GroupDetailsPage.name) {
    return CupertinoPageRoute(builder: groupDetailsBuilder);
  } else if (settings.name == FeeStructurePage.name) {
    return CupertinoPageRoute(builder: feeStructureBuilder);
  } else if (settings.name == CasianAnimatedListPage.name) {
    return CupertinoPageRoute(builder: casianBuilder);
  } else if (settings.name == FirstPage.name) {
    return CupertinoPageRoute(builder: firstPageBuilder);
  } else if (settings.name == LoginPage.name) {
    return CupertinoPageRoute(builder: loginPageBuilder);
  } else if (settings.name == MyLeavesPage.name) {
    return CupertinoPageRoute(builder: myLeavesPageBuilder);
  } else if (settings.name == LeaveDetailPage.name) {
    return CupertinoPageRoute(builder: leaveDetailPage);
  }
  return null;
}

Widget dashboardBuilder(BuildContext context) {
  return const Dashboard();
}

Widget groupDetailsBuilder(BuildContext context) {
  return GroupDetailsPage();
}

Widget feeStructureBuilder(BuildContext context) {
  return FeeStructurePage();
}

Widget casianBuilder(BuildContext context) {
  return const CasianAnimatedListPage();
}

Widget firstPageBuilder(BuildContext context) {
  return const FirstPage();
}

Widget splashScreenBuilder(BuildContext context) {
  return const SplashScreen();
}

Widget loginPageBuilder(BuildContext context) {
  return const LoginPage();
}

Widget myLeavesPageBuilder(BuildContext context) {
  return MyLeavesPage();
}

Widget leaveDetailPage(BuildContext context) {
  return const LeaveDetailPage();
}
