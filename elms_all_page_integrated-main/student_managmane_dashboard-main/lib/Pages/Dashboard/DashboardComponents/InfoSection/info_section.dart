import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardComponents/InfoSection/helper_class.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardComponents/InfoSection/info_section_item.dart';
import 'package:student_managmane_dashboard/Pages/FahadPage/screens/SuccessCasiansAnimatedListPage/casian_animated_list.dart';
import 'package:student_managmane_dashboard/Pages/StudentTimeTracking/student_time_tracker_main.dart';
import 'package:student_managmane_dashboard/Pages/fee_structure/fee_structure_page.dart';
import 'package:student_managmane_dashboard/Pages/group_details_page/group_details_page.dart';
import 'package:student_managmane_dashboard/ScreenSizes/screen_size.dart';

final _pageViewHeight = screenHeight * 0.4;

class InfoSectionViewer extends StatefulWidget {
  const InfoSectionViewer({Key? key}) : super(key: key);

  @override
  State<InfoSectionViewer> createState() => _InfoSectionViewerState();
}

class _InfoSectionViewerState extends State<InfoSectionViewer>
    with SingleTickerProviderStateMixin {
  late final PageController _movieCardPageController;

  double _movieCardPage = 0.0;
  int _movieCardIndex = 0;
  Helper helper = Helper();

  @override
  void initState() {
    _movieCardPageController = PageController(viewportFraction: 0.77)
      ..addListener(_movieCardPagePercentListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _pageViewHeight,
      child: PageView.builder(
        controller: _movieCardPageController,
        clipBehavior: Clip.none,
        itemCount: helper.getInfoItemsTitle().length,
        itemBuilder: (_, index) {
          final progress = (_movieCardPage - index);
          final scale = ui.lerpDouble(1, .8, progress.abs())!;
          final isCurrentPage = index == _movieCardIndex;
          final isScrolling =
              _movieCardPageController.position.isScrollingNotifier.value;
          final isFirstPage = index == 0;

          return Transform.scale(
            alignment: Alignment.lerp(
              Alignment.topLeft,
              Alignment.center,
              -progress,
            ),
            scale: isScrolling && isFirstPage ? 1 - progress : scale,
            child: GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.pushNamed(context, GroupDetailsPage.name);
                  } else if (index == 1) {
                    Navigator.pushNamed(context, FeeStructurePage.name);
                  } else if (index == 2) {
                    Navigator.pushNamed(context, TimeTrackerPage.name);
                  } else {
                    Navigator.of(context)
                        .pushNamed(CasianAnimatedListPage.name);
                  }
                },
                child: InfoSectionItem(
                    isCurrentPage: isCurrentPage,
                    imageSrc: helper.getInfoItemsTitle()[index].imageSrc,
                    title: helper.getInfoItemsTitle()[index].title)),
          );
        },
      ),
    );
  }

  _movieCardPagePercentListener() {
    setState(() {
      _movieCardPage = _movieCardPageController.page!;
      _movieCardIndex = _movieCardPageController.page!.round();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _movieCardPageController
      ..removeListener(_movieCardPagePercentListener)
      ..dispose();
  }
}
