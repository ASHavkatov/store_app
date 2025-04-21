import 'package:equatable/equatable.dart';

enum SignUpStatus {idle, loading, error, success}

class SignUpState extends Equatable{

  final SignUpStatus? status;
  const SignUpState({required this.status});
  factory SignUpState.initial(){
    return SignUpState(status: SignUpStatus.loading);
  }

  SignUpState copyWith({
    SignUpStatus? status
}){
    return SignUpState(status: status ?? this.status);
  }
  @override
  List<Object?> get props => [status];

}