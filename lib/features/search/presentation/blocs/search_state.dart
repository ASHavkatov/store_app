import 'package:equatable/equatable.dart';

import '../../../../data/models/product_model/product_model.dart';
enum SearchStatus { idle, error, loading }

class SearchState extends Equatable {
  const SearchState({required this.status, required this.products});

  final SearchStatus? status;
  final List<ProductModel>? products;

  factory SearchState.initial() {
    return SearchState(status: SearchStatus.loading, products: []);
  }

  SearchState copWith({
    required SearchStatus? status,
    List<ProductModel>? products,
  }) {
    return SearchState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }
  @override
  List<Object?> get props => [status,products];
}
