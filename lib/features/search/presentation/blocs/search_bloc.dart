import 'package:bloc/bloc.dart';
import 'package:store_app/data/repositories/product_repository.dart';
import 'package:store_app/features/search/presentation/blocs/search_event.dart';
import 'package:store_app/features/search/presentation/blocs/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductRepository _productRepo;

  SearchBloc({required ProductRepository productRepo})
    : _productRepo = productRepo,
      super(SearchState.initial()) {
    on<SearchLoad>(_onLoad);
    add(SearchLoad());
  }

  Future _onLoad(SearchLoad event, Emitter<SearchState> emit) async {
    final products = await _productRepo.fetchProduct(title: event.title);
    emit(state.copyWith(status: SearchStatus.success,products: products));
  }
}
