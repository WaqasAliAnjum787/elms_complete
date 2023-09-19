import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/leaves_page/my_leaves/leave_detail_page/leave_detail_page.dart';
import 'package:student_managmane_dashboard/Pages/leaves_page/my_leaves/my_leave_page_item.dart';
import 'package:student_managmane_dashboard/Pages/leaves_page/my_leaves/my_leaves_header_widget.dart';
import 'package:student_managmane_dashboard/Pages/leaves_page/my_leaves/my_leaves_list_helper.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

class MyLeavesPage extends StatelessWidget {
  MyLeavesPage({super.key});
  static const String name = "myLeavesPage";

  final List<Widget> list = List.generate(
      40,
      (index) => const MyLeavePageItem(
            leftSideText: "10 days",
            rightSideText: "10-12-2023",
            status: 'Status: Approved',
          ));

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: height * 0.02),
            const MyLeavesHeaderWidget(),
            SizedBox(height: height * 0.01),
            SizedBox(
              height: height * 0.71,
              width: width,
              child: TransformableListView.builder(
                itemCount: list.length,
                getTransformMatrix: MyLeaveListHelper.getTransformMatrix,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LeaveDetailPage.name);
                      },
                      child: list[index]);
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
