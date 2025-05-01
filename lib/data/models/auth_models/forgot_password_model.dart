import 'package:freezed_annotation/freezed_annotation.dart';
part 'forgot_password_model.freezed.dart';
part 'forgot_password_model.g.dart';

@freezed
abstract class ForgotPasswordModel with _$ForgotPasswordModel {
  const factory ForgotPasswordModel({required String email}) = _ForgotPasswordModel;
  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => _$ForgotPasswordModelFromJson(json);
}
