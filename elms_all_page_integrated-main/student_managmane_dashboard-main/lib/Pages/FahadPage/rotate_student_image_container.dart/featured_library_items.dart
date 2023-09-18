import 'package:flutter/material.dart';
import '../../FahadPage/model/holder.dart';

import '../model/rotate_animation_holder_manager.dart';

import '../screens/casian_student_detail.dart';
import 'library_item.dart';
import 'page_transitions.dart';

class FeaturedLibraryItems extends StatefulWidget {
  const FeaturedLibraryItems({
    required this.index,
    super.key,
    required this.animationController,
  });

  final AnimationController animationController;
  final int index;

  @override
  State<FeaturedLibraryItems> createState() => _FeaturedLibraryItemsState();
}

class _FeaturedLibraryItemsState extends State<FeaturedLibraryItems> {
  bool _expanded = true;
  late final Animation<double> offsetAnimation;
  late Tween<double> offsetAnimationTween;
  int tappedItemIndex = 0;

  @override
  void initState() {
    offsetAnimationTween = Tween<double>(begin: 0, end: -500);
    offsetAnimation = offsetAnimationTween.animate(
      CurvedAnimation(
          parent: widget.animationController, curve: Curves.easeInOut),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // Animated Container TO ROTATE FOR IMAGE
      child: LibraryItem(
        rotation: _expanded ? 0.1 : AnimationManager.startRotation,
        id: widget.index,
        image: DataHolder.storiesList[widget.index].imageUrl,
        onTap: () {
          if (!_expanded) {
            setState(() {
              _expanded = true;
            });
          } else {
            tappedItemIndex = widget.index;
            widget.animationController.forward();
            Navigator.of(context).push(
              createFadeInRoute(
                routePageBuilder: (
                  BuildContext context,
                  Animation<double> animation,
                  _,
                ) {
                  return CasianStudentDetail(
                    routeAnimation: animation,
                    image: DataHolder.storiesList[widget.index].imageUrl,
                    heroTag: 'image-${widget.index}-hero',
                    currentPosition:
                        DataHolder.storiesList[widget.index].currentPosition,
                    companny: DataHolder.storiesList[widget.index].company,
                    linkdinUrl:
                        DataHolder.storiesList[widget.index].linkdinProfile,
                    name: DataHolder.storiesList[widget.index].name,
                  );
                },
              ),
            ).then((value) {
              widget.animationController.reverse();
            });
          }
        },
      ),
    );
  }
}
