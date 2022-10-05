class LoginData {
  final String errorMessage;

  const LoginData({required this.errorMessage});

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