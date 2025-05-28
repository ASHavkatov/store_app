import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:bloc/bloc.dart';
import 'package:store_app/features/customer_service/blocs/customer_service_state.dart';
part 'customer_service_event.dart';

class CustomerServiceBloc extends Bloc<CustomerServiceEvent, CustomerServiceState> {
  CustomerServiceBloc() : super(CustomerServiceState.initial()) {
    on<CustomerServiceReceiveEvent>(_onMessageReceived);
    on<CustomerServiceSendEvent>(_onMessageSend);
    initializeWebSocket();
  }

  late final WebSocketChannel websocket;
  late final StreamSubscription subscription;

  Future<void> close()async{
    super.close();
    websocket.sink.close(status.normalClosure, "Connection closed");
    subscription.cancel();
  }


  Future _onMessageReceived(CustomerServiceReceiveEvent event, Emitter<CustomerServiceState> emit) async {
    var messages = List<Map<String, dynamic>>.from(state.messages);
    messages.add(event.message);
    emit(state.copyWith(messages: messages));
  }

  Future _onMessageSend(CustomerServiceSendEvent event, Emitter<CustomerServiceState> emit) async {
    final message = {"message": event.message, "date": DateFormat("HH:mm").format( DateTime.now().toLocal()), "direction": "from"};
    var messages = List<Map<String, dynamic>>.from(state.messages);
    messages.add(message);
    websocket.sink.add(jsonEncode(message));
    emit(state.copyWith(messages: messages));
  }

  Future initializeWebSocket() async {
    final uri = Uri.parse("ws://192.168.11.156:8888/chat");
    websocket = WebSocketChannel.connect(uri);
    await websocket.ready;
    subscription = websocket.stream.listen((message) {
      add(CustomerServiceReceiveEvent(message: jsonDecode(message)));
    });
  }

}
