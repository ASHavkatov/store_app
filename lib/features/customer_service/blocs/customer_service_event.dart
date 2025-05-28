part of 'customer_service_bloc.dart';

sealed class CustomerServiceEvent {}

final class CustomerServiceSendEvent extends CustomerServiceEvent{
  final String message;

  CustomerServiceSendEvent({required this.message});
}

final class CustomerServiceReceiveEvent extends CustomerServiceEvent{
  final Map<String,dynamic> message;

  CustomerServiceReceiveEvent({required this.message});
}