import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_service_state.freezed.dart';

enum CustomerServiceStatus{idle, loading, error, success}

@freezed
abstract class CustomerServiceState with _$CustomerServiceState{
  const factory CustomerServiceState({required CustomerServiceStatus status, required List<Map<String,dynamic>> messages}) = _CustomerServiceState;
  factory CustomerServiceState.initial(){
    return CustomerServiceState(status: CustomerServiceStatus.idle, messages: []);
  }
}