class LoginData {
  const LoginData({required this.errorMessage});

  final String errorMessage;

  LoginData copyWith({
    String? errorMessage,
  }) {
    return LoginData(
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory LoginData.init() => const LoginData(
        errorMessage: '',
      );
}
