import 'package:equatable/equatable.dart';
import 'package:store_app/data/models/product_model.dart';

enum HomeStatus{idle,error,loading}

class HomeState extends Equatable{
  const HomeState({required this.status,required this.products});

  final HomeStatus? status;

  final List<ProductModel>? products;

  factory HomeState.initial(){
    return HomeState(status: HomeStatus.loading, products: []);
  }
  HomeState copyWith({required HomeStatus? status,List<ProductModel>? products}){
    return HomeState(status: status ?? this.status, products: products ?? this.products);
  }

  @override
  List<Object?> get props =>[status,products];
}