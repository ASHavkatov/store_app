import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repositories/card_repositories/card_repository.dart';
import 'package:store_app/features/cards/blocs/card_event.dart';
import 'package:store_app/features/cards/blocs/card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final CardRepository _repo;

  CardBloc({required CardRepository repo})
    : _repo = repo,
      super(CardState.initial()){
    on<CardLoad>(_onLoad);
    add(CardLoad());
  }

  Future<void>_onLoad(CardEvent event, Emitter<CardState>emit)async{
    final detail = await _repo.fetchCard();
    emit(state.copyWith(model: detail,status: CardStatus.idle));
  }
}
