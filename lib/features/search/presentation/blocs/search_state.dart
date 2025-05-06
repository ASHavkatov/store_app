import 'package:equatable/equatable.dart';
import '../../../../data/models/product_model/product_model.dart';

enum SearchStatus { idle, error, loading, success }

class SearchState extends Equatable {
  const SearchState({
    required this.status,
    required this.products,
    required this.recentSearches,
  });

  final SearchStatus status;
  final List<ProductModel> products;
  final List<String> recentSearches;

  factory SearchState.initial() {
    return const SearchState(
      status: SearchStatus.idle,
      products: [],
      recentSearches: [],
    );
  }

  SearchState copyWith({
    SearchStatus? status,
    List<ProductModel>? products,
    List<String>? recentSearches,
  }) {
    return SearchState(
      status: status ?? this.status,
      products: products ?? this.products,
      recentSearches: recentSearches ?? this.recentSearches,
    );
  }

  @override
  List<Object?> get props => [status, products, recentSearches];
}
