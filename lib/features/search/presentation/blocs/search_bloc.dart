import 'package:bloc/bloc.dart';
import 'package:store_app/features/search/presentation/blocs/search_event.dart';
import 'package:store_app/features/search/presentation/blocs/search_state.dart';

import '../../../../data/repositories/product_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductRepository _productRepo;

  SearchBloc({required ProductRepository productRepo})
      : _productRepo = productRepo,
        super(SearchState.initial()) {
    on<SearchLoad>(_onLoad);
  }

  Future<void> _onLoad(SearchLoad event, Emitter<SearchState> emit) async {
    final title = event.title;

    if (title!.isEmpty) {
      emit(SearchState.initial());
      return;
    }

    emit(state.copyWith(status: SearchStatus.loading));

    await Future.delayed(Duration(milliseconds: 500));

    try {
      final products = await _productRepo.fetchProduct(title: title);
      emit(state.copyWith(
        status: SearchStatus.success,
        products: products,
      ));
    } catch (_) {
      emit(state.copyWith(status: SearchStatus.error));
    }
  }
}
