import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/group_details_page/group_detail_list_item.dart';
import 'package:student_managmane_dashboard/Pages/group_details_page/header_widget_of_group_details.dart';
import 'package:student_managmane_dashboard/helper_comp/list_helper.dart';

import 'package:transformable_list_view/transformable_list_view.dart';

class GroupDetailsPage extends StatefulWidget {
  GroupDetailsPage({super.key});
  static const name = 'groupDetail';

  @override
  State<GroupDetailsPage> createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage> {
  final List<Widget> list = List.generate(40, (index) {
    return const GroupDetailListItem(
        leftSide: "Mentor", rightSide: "Sir Noman Ameer Khan");
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.01),
                const HeaderWidgetOfGroupDetails(),
                Container(
                  height: height * 0.01,
                  color: Colors.white,
                ),
                SizedBox(
                  height: height * 0.72,
                  child: TransformableListView.builder(
                    getTransformMatrix: ListHelper.getTransformMatrix,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return list[index];
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
