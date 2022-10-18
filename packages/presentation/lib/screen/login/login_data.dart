class LoginData {
  const LoginData({
    required this.errorMessage,
    this.validateLogin,
    this.validatePassword,
  });

  final String errorMessage;
  final String? validateLogin;
  final String? validatePassword;

  LoginData copyWith({
    String? errorMessage,
    String? validateLogin,
    String? validatePassword,
  }) {
    return LoginData(
      errorMessage: errorMessage ?? this.errorMessage,
      validateLogin:validateLogin ?? this.validateLogin,
      validatePassword:validatePassword ?? this.validatePassword,
    );
  }

  factory LoginData.init() => const LoginData(
        errorMessage: '',
      );
}
