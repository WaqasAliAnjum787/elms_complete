import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_managmane_dashboard/Pages/fee_structure/flip_a_card/back_widget.dart';
import 'package:student_managmane_dashboard/Pages/fee_structure/flip_a_card/flip_a_card.dart';
import 'package:student_managmane_dashboard/Pages/fee_structure/flip_a_card/front_widget.dart';
import 'package:student_managmane_dashboard/Pages/fee_structure/flip_a_card_bloc/card_bloc.dart';

class HeaderWidgetOfFeeStructure extends StatefulWidget {
  const HeaderWidgetOfFeeStructure(
      {super.key, required this.noOfInstallments, required this.totalAmount});

  final int noOfInstallments;
  final double totalAmount;

  @override
  State<HeaderWidgetOfFeeStructure> createState() =>
      _HeaderWidgetOfFeeStructure();
}

class _HeaderWidgetOfFeeStructure extends State<HeaderWidgetOfFeeStructure> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc, CardState>(
      builder: (context, state) {
        return CardHolder(
          toggler: (state as CardInitial).toggler,
          frontCard: GestureDetector(
            onTap: () {
              isFlipped(state);
            },
            child: const FrontWidget(),
          ),
          backCard: GestureDetector(
            onTap: () {
              isFlipped(state);
            },
            child: BackWidget(
                noOfInstallments: widget.noOfInstallments,
                totalAmount: widget.totalAmount),
          ),
        );
      },
    );
  }

  //this will Flip the card
  void isFlipped(CardState state) {
    if ((state as CardInitial).toggler) {
      context.read<CardBloc>().add(FrontCardEvent());
    } else {
      context.read<CardBloc>().add(BackCardEvent());
    }
  }
}
