import 'package:domain/enum/error_type.dart';

class LoginAndPasswordErrors {
  LoginAndPasswordErrors({
    required this.loginError,
    required this.passwordError,
  });

  ValidationErrorType? loginError;
  ValidationErrorType? passwordError;
}
