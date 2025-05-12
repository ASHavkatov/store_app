import 'package:bloc/bloc.dart';
import 'package:store_app/data/repositories/product_repository_remote.dart';
import 'package:store_app/features/saved/blocs/saved_event.dart';
import 'package:store_app/features/saved/blocs/saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final ProductRepositoryRemote _repo;

  SavedBloc({required ProductRepositoryRemote repo})
      : _repo = repo,
        super(SavedState.initial()) {
    on<SavedLoading>(_onLoading);
    on<SavedLoadS>(_onLikes);
    on<UnSavedLoadS>(_onUnLike);

    add(SavedLoading());
  }

  Future<void> _onLoading(SavedLoading event, Emitter<SavedState> emit) async {
    final saved = await _repo.fetchSavedProducts();
    emit(state.copyWith(status: SavedStatus.idle, saved: saved));
  }

  Future<void> _onLikes(SavedLoadS event, Emitter<SavedState> emit) async {
    final success = await _repo.client.fetchIsLike(event.like);
    final products = state.saved!.map((e) {
      if (e.id == event.like) {
        return e.copyWith(isLike: true);
      }
      return e;
    }).toList();

    emit(state.copyWith(
      status: SavedStatus.idle,
      saved: products,
      isLike: success,
    ));
  }

  Future<void> _onUnLike(UnSavedLoadS event, Emitter<SavedState> emit) async {
    final success = await _repo.client.fetchUnLike(event.unLike);
    final products = state.saved!.map((e) {
      if (e.id == event.unLike) {
        return e.copyWith(isLike: false);
      }
      return e;
    }).toList();

    emit(state.copyWith(
      status: SavedStatus.idle,
      saved: products,
      isLike: success,
    ));
  }
}
