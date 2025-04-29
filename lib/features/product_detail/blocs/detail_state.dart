import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/detail_model/detail_model.dart';
part 'detail_state.freezed.dart';

enum DetailStatus { idle, loading, error }
@freezed
abstract class DetailState with _$DetailState{

  const factory DetailState({required DetailStatus? status, required DetailModel? model})= _DetailState;

  factory DetailState.initial() {
    return DetailState(status: DetailStatus.loading, model: null);
  }

}
