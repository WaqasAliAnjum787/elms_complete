import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/fee_structure/header_of_fee_structure.dart';
import 'package:student_managmane_dashboard/Pages/fee_structure/installment_detail_page/installment_detail_page.dart';
import 'package:student_managmane_dashboard/Pages/fee_structure/installment_item.dart';
import 'package:student_managmane_dashboard/helper_comp/list_helper.dart';

import 'package:transformable_list_view/transformable_list_view.dart';

class FeeStructurePage extends StatelessWidget {
  FeeStructurePage({super.key});
  static const name = 'feeStructure';

  final List<Widget> list = List.generate(
      40,
      (index) => const FeeInstallmentItem(
          installment: "Installment No", installmentNumber: 1));

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
                SizedBox(
                  height: height * 0.01,
                ),
                const HeaderWidgetOfFeeStructure(
                    noOfInstallments: 12, totalAmount: 75000),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  height: height * 0.72,
                  child: TransformableListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const InstallmentDetailPage();
                              },
                            ));
                          },
                          child: list[index]);
                    },
                    getTransformMatrix: ListHelper.getTransformMatrix,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
