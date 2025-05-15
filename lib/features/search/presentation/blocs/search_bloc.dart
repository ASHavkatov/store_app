import 'package:bloc/bloc.dart';
import 'package:store_app/features/search/presentation/blocs/search_event.dart';
import 'package:store_app/features/search/presentation/blocs/search_state.dart';
import '../../../../data/repositories/products/product_repository.dart';
import 'package:hive/hive.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductRepository _productRepo;

  SearchBloc({required ProductRepository productRepo})
      : _productRepo = productRepo,
        super(SearchState.initial()) {
    on<SearchLoad>(_onLoad);
    on<AddRecentSearch>(_onAddRecentSearch);
    on<DeleteText>(_onDeleteText);
    on<ClearAllSearches>(_onClearAllSearches);
    on<LoadRecentSearches>(_onLoadRecentSearches);
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

  Future<void> _onAddRecentSearch(AddRecentSearch event, Emitter<SearchState> emit) async {
    final box = await Hive.openBox<String>('saved');
    await box.add( event.search);
    final recentSearches = box.values.toList();
    emit(state.copyWith(recentSearches: recentSearches));
  }

  Future<void> _onDeleteText(DeleteText event, Emitter<SearchState> emit) async {
    final box = await Hive.openBox<String>('saved');
    await box.deleteAt(event.index);
    final recentSearches = box.values.toList();
    emit(state.copyWith(recentSearches: recentSearches));
  }

  Future<void> _onClearAllSearches(ClearAllSearches event, Emitter<SearchState> emit) async {
    final box = await Hive.openBox<String>('saved');
    await box.clear();
    emit(state.copyWith(recentSearches: []));
  }

  Future<void> _onLoadRecentSearches(LoadRecentSearches event, Emitter<SearchState> emit) async {
    try {
      final box = await Hive.openBox<String>('saved');
      final recentSearches = box.values.toList();
      emit(state.copyWith(recentSearches: recentSearches));
    } catch (_) {
      emit(state.copyWith(status: SearchStatus.error));
    }
  }
}
