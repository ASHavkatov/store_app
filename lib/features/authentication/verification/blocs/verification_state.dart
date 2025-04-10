import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum VerificationStatus { idle, loading, error, success }

class VerificationState extends Equatable{
  final VerificationStatus status;
  final String? message;

  const VerificationState({required this.status, required this.message});

  VerificationState copyWith({
    VerificationStatus? status,
    String? message,
  }){
    return VerificationState  (
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
  factory VerificationState.initial(){
    return VerificationState( message:  null, status: VerificationStatus.loading);
  }
  @override
  List<Object?> get props => [ status, message];

}