import 'package:flutter/material.dart';
import '../../FahadPage/model/holder.dart';

import 'work_shop_cards.dart';
// import 'package:student_managment_app_screens/model/holder.dart';
// import 'package:student_managment_app_screens/screens/work_shop_cards.dart';

class WorkShopTimeTrackerPage extends StatefulWidget {
  const WorkShopTimeTrackerPage({super.key});

  @override
  State<WorkShopTimeTrackerPage> createState() =>
      _WorkShopTimeTrackerPageState();
}

class _WorkShopTimeTrackerPageState extends State<WorkShopTimeTrackerPage> {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(children: [
        Container(
          height: height * 0.3,
          color: Colors.amber,
        ),
        SizedBox(
          height: height * 0.7,
          child: GridView.builder(
            itemCount: 7,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              // crossAxisSpacing: width * 0.035,
              // mainAxisSpacing: height * 0.01
            ),
            itemBuilder: (context, index) => WorkShopCards(
              text: index.toString(),
              linearGradient: DataHolder.gradientList[index],
              imageUrl: DataHolder.ImageListForWorkShop[index],
            ),
          ),
        )
      ]),
    );
  }
}
