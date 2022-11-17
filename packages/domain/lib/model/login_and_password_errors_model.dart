import 'package:domain/enum/login_error_type.dart';

class LoginAndPasswordErrors {
  LoginAndPasswordErrors({
    required this.loginError,
    required this.passwordError,
  });

  ValidationLoginErrorType? loginError;
  ValidationLoginErrorType? passwordError;
}
