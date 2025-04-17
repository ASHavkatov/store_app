import 'package:bloc/bloc.dart';
import 'package:store_app/data/repositories/product_repository.dart';
import 'package:store_app/features/home/managers/home_event.dart';
import 'package:store_app/features/home/managers/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository _productRepo;

  HomeBloc({required ProductRepository productRepo})
    : _productRepo = productRepo,
      super(HomeState.initial()) {
    on<HomeLoad>((event, emit) async {
      final products = await _productRepo.fetchProduct();
      emit(state.copyWith(status: HomeStatus.idle, products: products));
    });
    on<SavedLoad>(onLike);
    on<UnSavedLoad>(unLike);
    add(HomeLoad());
  }

  Future<void> onLike(SavedLoad event, Emitter<HomeState> emit) async {
    final success = await _productRepo.client.fetchIsLike(event.like);
    final products =
        state.products!.map((e) {
          if (e.id == event.like) {
            return e.copyWith(isLike: true);
          }
          return e;
        }).toList();
    emit(
      state.copyWith(
        status: HomeStatus.idle,
        products: products,
        isLike: success,
      ),
    );
  }

  Future<void> unLike(UnSavedLoad event, Emitter<HomeState> emit) async {
    final success = await _productRepo.client.fetchUnLike(event.unLike);
    final product =
        state.products!.map((e) {
          if (e.id == event.unLike) {
            return e.copyWith(isLike: false);
          }
          return e;
        }).toList();
    emit(
      state.copyWith(
        status: HomeStatus.idle,
        products: product,
        isLike: success,
      ),
    );
  }
}
