import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/models/card_models/card_model.dart';

part 'card_state.freezed.dart';

enum CardStatus { error, loading, idle }

@freezed
abstract class CardState with _$CardState {
  const factory CardState({
   required List<CardModel>? model,
    required CardStatus status,
  }) = _CardState;

  factory CardState.initial() {
    return const CardState(status: CardStatus.loading, model: null);
  }
}
