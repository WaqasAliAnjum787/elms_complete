import 'dart:math';
import 'package:flutter/widgets.dart';

class CardHolder extends StatelessWidget {
  final bool toggler;
  final Widget frontCard;
  final Widget backCard;

  const CardHolder({
    super.key,
    required this.toggler,
    required this.backCard,
    required this.frontCard,
  });

  //okay

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: _transitionBuilder,
        //switchInCurve: Curves.bounceInOut,
        switchInCurve: Curves.bounceIn,
        switchOutCurve: Curves.bounceOut,
        child: toggler
            ? SizedBox(key: const ValueKey('front'), child: frontCard)
            : SizedBox(key: const ValueKey('back'), child: backCard),
      ),
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnimation = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnimation,
      child: widget,
      builder: (context, widget) {
        final isFront = ValueKey(toggler) == widget!.key;
        final rotationY = isFront
            ? rotateAnimation.value
            : min(rotateAnimation.value, pi * 0.5);
        return Transform(
          transform: Matrix4.rotationY(rotationY)..setEntry(0, 2, 0),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}
