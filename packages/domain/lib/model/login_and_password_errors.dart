import 'package:domain/enum/login_error_type.dart';
import 'package:domain/exeptions/base_exception.dart';

class LoginAndPasswordErrors extends BaseException {
  LoginAndPasswordErrors({
    required this.loginError,
    required this.passwordError,
  });

  ValidationLoginErrorType? loginError;
  ValidationLoginErrorType? passwordError;
}
