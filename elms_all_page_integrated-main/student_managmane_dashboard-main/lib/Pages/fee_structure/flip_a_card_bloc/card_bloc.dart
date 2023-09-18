import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardInitial(toggler: true)) {
    on<FrontCardEvent>((event, emit) => emit(CardInitial(toggler: false)));
    on<BackCardEvent>((event, emit) => emit(CardInitial(toggler: true)));
  }
}
