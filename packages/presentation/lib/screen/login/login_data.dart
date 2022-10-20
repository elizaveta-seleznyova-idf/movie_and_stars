class LoginData {
  const LoginData({
    this.validateLogin,
    this.validatePassword,
  });

  final String? validateLogin;
  final String? validatePassword;

  LoginData copyWith({
    String? validateLogin,
    String? validatePassword,
  }) {
    return LoginData(
      validateLogin: validateLogin ?? this.validateLogin,
      validatePassword: validatePassword ?? this.validatePassword,
    );
  }

  factory LoginData.init() => const LoginData();
}
