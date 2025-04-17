import 'package:equatable/equatable.dart';
import 'package:store_app/data/models/product_model.dart';

enum HomeStatus{idle,error,loading}

class HomeState extends Equatable{
  const HomeState( {required this.status,required this.products, this.isSuccess});

  final HomeStatus? status;

  final List<ProductModel>? products;
  final bool ?isSuccess;

  factory HomeState.initial(){
    return HomeState(status: HomeStatus.loading, products: [], isSuccess:  null);
  }
  HomeState copyWith({required HomeStatus? status,List<ProductModel>? products, bool? isLike}){
    return HomeState(status: status ?? this.status, products: products ?? this.products, isSuccess: isLike ?? isSuccess);
  }

  @override
  List<Object?> get props =>[status,products, isSuccess];
}