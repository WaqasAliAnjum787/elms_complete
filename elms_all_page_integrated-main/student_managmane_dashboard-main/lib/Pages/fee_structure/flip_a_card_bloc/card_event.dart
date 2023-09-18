part of 'card_bloc.dart';

@immutable
sealed class CardEvent {}

class FrontCardEvent extends CardEvent {}

class BackCardEvent extends CardEvent {}
