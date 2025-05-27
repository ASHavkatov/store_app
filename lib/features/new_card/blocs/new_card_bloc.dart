import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:store_app/data/repositories/card_repositories/new_card_repository.dart';
import 'package:store_app/features/new_card/blocs/new_card_event.dart';
import 'package:store_app/features/new_card/blocs/new_card_state.dart';

class NewCardBloc extends Bloc<NewCardEvent, NewCardState> {
  final NewCardRepository _repo;
  final cardNumber = TextEditingController();
  final expiryDate = TextEditingController();
  final securityCode = TextEditingController();

  NewCardBloc({required NewCardRepository repo}) : _repo = repo, super(NewCardState.initial()) {
    on<NewCardLoad>(_onPostNewCard);
  }

  Future<void> _onPostNewCard(NewCardLoad event, Emitter<NewCardState> emit) async {
    emit(state.copyWith(status: NewCardStatus.loading));
    try {
      final parts = event.expiryDate.split('/');
      final month = parts[0];
      final year = parts[1];
      final formattedDate = '20$year-$month-26';
      final success = await _repo.postNewCard(
        cardNumber: event.cardNumber,
        expiryDate: formattedDate,
        securityCode: event.securityCode,
      );

        emit(state.copyWith(status: NewCardStatus.success));
    } catch (e) {
      emit(state.copyWith(status: NewCardStatus.error));
    }
  }
}
