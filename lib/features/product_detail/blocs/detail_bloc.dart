import 'package:bloc/bloc.dart';
import 'package:store_app/data/repositories/product_repository.dart';
import 'package:store_app/features/product_detail/blocs/detail_event.dart';
import 'package:store_app/features/product_detail/blocs/detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState>{
  final ProductRepository _repo;
  DetailBloc({required ProductRepository repo}): _repo = repo, super(DetailState.initial()){
    on<DetailLoading>(_onLoad);
  }

  Future _onLoad(DetailLoading event, Emitter<DetailState> emit)async{
    final details = await _repo.fetchDetail(event.id);
    emit(state.copyWith(model: details, status: DetailStatus.idle));
    }
}

