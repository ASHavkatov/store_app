import 'package:bloc/bloc.dart';
import 'package:store_app/data/repositories/product_repository.dart';
import 'package:store_app/features/home/managers/home_event.dart';
import 'package:store_app/features/home/managers/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository _productRepo;

  HomeBloc({required ProductRepository productRepo})
    : _productRepo = productRepo,
      super(HomeState.initial()) {
    on<HomeLoad>((event, emit)async {
      final products = await _productRepo.fetchProduct();
      emit(state.copyWith(status: HomeStatus.idle,products: products));
    });
    add(HomeLoad());
  }
}
