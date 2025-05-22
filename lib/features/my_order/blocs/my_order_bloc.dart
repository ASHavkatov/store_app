import 'package:bloc/bloc.dart';
import 'package:store_app/data/repositories/my_orders/my_order_repository.dart';
import 'package:store_app/features/my_order/blocs/my_order_event.dart';
import 'package:store_app/features/my_order/blocs/my_order_state.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  final MyOrderRepository _repo;

  MyOrderBloc({required MyOrderRepository repo})
      : _repo = repo,
        super(MyOrderState.initial()){
    on<MyOrderLoad>(_onLoad);
  }


  Future<void> _onLoad(MyOrderEvent event, Emitter<MyOrderState> emit) async{
    final order = await _repo.fetchMyOrders();
    emit(state.copyWith(model: order, status: MyOrderStatus.success));
  }
  }