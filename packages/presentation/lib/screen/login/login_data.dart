class LoginData {
  LoginData({
    this.validateLogin,
    this.validatePassword,
    required this.loginText,
    required this.passwordText,
  });

  final String? validateLogin;
  final String? validatePassword;
  String loginText = '';
  String passwordText = '';

  LoginData copyWith({
    String? validateLogin,
    String? validatePassword,
  }) {
    return LoginData(
      validateLogin: validateLogin ?? this.validateLogin,
      validatePassword: validatePassword ?? this.validatePassword,
      loginText: '',
      passwordText: '',
    );
  }

  factory LoginData.init() => LoginData(
        loginText: '',
        passwordText: '',
      );
}
