class Validation {
  final String login;
  final String password;

  Validation(
      this.login,
      this.password,
      );

  bool isValid() => login.isEmpty && password.isEmpty;
}