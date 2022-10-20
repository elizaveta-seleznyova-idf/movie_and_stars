import 'package:collection/collection.dart';
import 'package:domain/enum/error_type.dart';
import 'package:domain/model/login_and_password_errors_model.dart';
import 'package:domain/model/user_email_pass.dart';
import 'package:domain/model/validation.dart';
import 'package:domain/use_case/use_case.dart';

class ValidationUseCase
    extends UseCaseParams<UserEmailPass, LoginAndPasswordErrors> {
  ValidationUseCase({
    required this.loginValidators,
    required this.passwordValidators,
  });

  final List<Validation> loginValidators;
  final List<Validation> passwordValidators;

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
    final Validation? loginFailed = loginValidators.firstWhereOrNull(
      (element) => !element.isValid(params.login),
    );
    final Validation? passwordFailed = passwordValidators.firstWhereOrNull(
      (element) => !element.isValid(params.password),
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
