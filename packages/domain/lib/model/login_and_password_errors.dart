import 'package:domain/enum/error_type.dart';
import 'package:domain/exeptions/base_exception.dart';

class LoginAndPasswordErrors extends BaseException {
  LoginAndPasswordErrors({
    required this.loginError,
    required this.passwordError,
  });

  ValidationErrorType? loginError;
  ValidationErrorType? passwordError;
}
