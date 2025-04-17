import 'package:bloc/bloc.dart';
import 'package:store_app/data/repositories/product_repository.dart';
import 'package:store_app/features/home/managers/home_event.dart';
import 'package:store_app/features/home/managers/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository _productRepo;

  HomeBloc({required ProductRepository productRepo})
    : _productRepo = productRepo,
      super(HomeState.initial()) {
    on<HomeLoad>(_onLoad);
    add(HomeLoad(title: null, categoryId: null));
  }

  Future _onLoad(HomeLoad event, Emitter<HomeState> emit) async {
    print("nimadalfsjdfjf   ${event.minPrice}");
    final products = await _productRepo.fetchProduct(
      event.title,
      event.categoryId,
      event.sizeId,
      event.minPrice,
      event.maxPrice,
        event.orderBy
    );
    emit(state.copyWith(products: products, status: HomeStatus.idle));
    final categories = await _productRepo.fetchCategories();
    emit(state.copyWith(categories: categories, status: HomeStatus.idle));
  }
}
