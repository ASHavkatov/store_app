import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_app/data/models/card_models/new_card_model.dart';
import 'package:store_app/data/repositories/card_repositories/new_card_repository.dart';
import 'package:store_app/features/new_card/blocs/new_card_event.dart';
import 'package:store_app/features/new_card/blocs/new_card_state.dart';

class NewCardBloc extends Bloc<NewCardEvent, NewCardState> {
  final NewCardRepository _repo;

  NewCardBloc({required NewCardRepository repo})
      : _repo = repo,
        super(NewCardState.initial()) {
    on<NewCardSendEvent>(_onSendCard);
  }

  Future<void> _onSendCard(NewCardSendEvent event,
      Emitter<NewCardState> emit) async {

      final success = await _repo.postNewCard(
          event.cardNumber, event.expiryDate, event.securityCode);
      if (success) {
        final newCard = NewCardModel(cardNumber: event.cardNumber, expiryDate: event.expiryDate, securityCode: event.securityCode);
        emit(state.copyWith(status: NewCardStatus.idle,  model: newCard));
      }  else {
        emit(state.copyWith(status: NewCardStatus.error));
      }
  }
}