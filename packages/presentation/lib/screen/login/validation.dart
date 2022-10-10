class Validation {
  Validation(
    this.login,
    this.password,
  );

  final String login;
  final String password;

  bool isValid() => login.isEmpty && password.isEmpty;
}
