import 'package:bloc/bloc.dart';
import 'package:store_app/data/repositories/products/product_repository.dart';
import 'package:store_app/features/my_card/blocs/my_cart_event.dart';
import 'package:store_app/features/my_card/blocs/my_cart_state.dart';

class MyCartBloc extends Bloc<MyCartEvent, MyCartState> {
  final ProductRepository _repo;

  MyCartBloc({required ProductRepository repo})
    : _repo = repo,
      super(MyCartState.initial()) {
    // on<MyCartLoading>(_onLoad);
    add(MyCartLoading());
  }

  Future<void> _onLoad(MyCartLoading event, Emitter<MyCartState> emit) async {
    final cart = await _repo.fetchMyCart();
    emit(state.copyWith(model: cart, status: MyCartStatus.idle));
  }
}
