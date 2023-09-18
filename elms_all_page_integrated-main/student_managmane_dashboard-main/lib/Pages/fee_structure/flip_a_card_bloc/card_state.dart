part of 'card_bloc.dart';

@immutable
sealed class CardState {}

final class CardInitial extends CardState {
  final bool toggler;

  CardInitial({required this.toggler});
}
