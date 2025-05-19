import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/models/card_models/new_card_model.dart';

part 'new_card_state.freezed.dart';

enum NewCardStatus { error, loading, idle }

@freezed
abstract class NewCardState with _$NewCardState {
  const factory NewCardState({
    required NewCardStatus status,
    required NewCardModel? model,
  }) = _NewCardState;

  factory NewCardState.initial() {
    return NewCardState(status: NewCardStatus.loading, model: null);
  }
}
