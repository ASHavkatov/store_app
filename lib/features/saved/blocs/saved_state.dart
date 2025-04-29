import 'package:equatable/equatable.dart';
import 'package:store_app/data/models/product_model/product_model.dart';

enum SavedStatus { idle, error, loading }

class SavedState extends Equatable {
  const SavedState({required this.saved, required this.status, this.isSuccess});

  final SavedStatus? status;
  final List<ProductModel>? saved;
  final bool? isSuccess;

  factory SavedState.initial() {
    return SavedState(status: SavedStatus.loading, saved: [], isSuccess: null);
  }

  SavedState copyWith({
    required SavedStatus? status,
    List<ProductModel>? saved,
    bool? isLike,
  }) {
    return SavedState(
      saved: saved ?? this.saved,
      status: status ?? this.status,
      isSuccess: isLike ?? isSuccess,
    );
  }
  @override
  List<Object?> get props =>[status, saved, isSuccess];
}
