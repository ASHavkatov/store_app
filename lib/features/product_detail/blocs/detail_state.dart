import 'package:equatable/equatable.dart';

import '../../../data/models/detail_model.dart';

enum DetailStatus { idle, loading, error }

class DetailState extends Equatable{
  final DetailStatus? status;
  final DetailModel? model;

  DetailState({required this.status, required this.model});

  factory DetailState.initial() {
    return DetailState(status: DetailStatus.loading, model: null);
  }

  DetailState copyWith({DetailModel? model, DetailStatus? status}) {
    return DetailState(
      status: status ?? this.status,
      model: model ?? this.model,
    );
  }

  @override
  List<Object?> get props => [status, model];
}
