import 'package:domain/enum/error_type.dart';
import 'package:domain/model/login_and_password_errors_model.dart';
import 'package:domain/model/user_email_pass.dart';
import 'package:domain/model/validation.dart';
import 'package:domain/use_case/use_case.dart';

class ValidationUseCase
    extends UseCaseParams<UserEmailPass, LoginAndPasswordErrors> {
  static const String _regexParameters = r'^\w{7,}$';
  static const int _minLengthLogin = 8;

  final List _loginValidators = [
    RequiredFieldValidation(),
    MinLengthValidation(minLength: _minLengthLogin),
  ];
  final List _passwordValidators = [
    RequiredFieldValidation(),
    RegexValidation(regex: _regexParameters),
  ];

  ValidationErrorType? getEnumByValidator(Validation? validator) {
    if (validator is RequiredFieldValidation) {
      return ValidationErrorType.requiredErrorType;
    }
    if (validator is MinLengthValidation) {
      return ValidationErrorType.minLengthErrorType;
    }
    if (validator is RegexValidation) {
      return ValidationErrorType.regexErrorType;
    }
    return null;
  }

  @override
  LoginAndPasswordErrors call(UserEmailPass params) {
    final Validation? loginFailed = _loginValidators.firstWhere(
      (element) => !element.isValid(params.login),
      orElse: () => null,
    );
    final Validation? passwordFailed = _passwordValidators.firstWhere(
      (element) => !element.isValid(params.password),
      orElse: () => null,
    );

    final ValidationErrorType? loginInvalidType =
        getEnumByValidator(loginFailed);

    final ValidationErrorType? passwordInvalidType =
        getEnumByValidator(passwordFailed);

    return LoginAndPasswordErrors(
      loginError: loginInvalidType,
      passwordError: passwordInvalidType,
    );
  }
}
