import 'package:equatable/equatable.dart';
import 'package:store_app/data/models/product_model.dart';

import '../../../data/models/category_model.dart';

enum HomeStatus { idle, error, loading }

class HomeState extends Equatable {
  const HomeState({required this.status, required this.products, required this.categories});

  final HomeStatus? status;
  final List<ProductModel> products;
  final List<CategoryModel> categories;

  factory HomeState.initial() {
    return HomeState(status: HomeStatus.loading, products: [], categories: []);  // Initialize categories as an empty list
  }

  HomeState copyWith({
    HomeStatus? status,
    List<ProductModel>? products,
    List<CategoryModel>? categories,  // Add categories to copyWith method
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      categories: categories ?? this.categories,  // Include categories in copyWith
    );
  }

  @override
  List<Object?> get props => [status, products, categories];  // Include categories in Equatable props
}
