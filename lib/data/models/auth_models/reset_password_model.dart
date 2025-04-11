class ResetPasswordModel {
  final String email, password, code;

  ResetPasswordModel({
    required this.email,
    required this.password,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password, "code": code};
  }
}
