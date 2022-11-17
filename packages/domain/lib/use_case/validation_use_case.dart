import 'package:collection/collection.dart';
import 'package:domain/enum/login_error_type.dart';
import 'package:domain/mappers/validation_mapper.dart';
import 'package:domain/model/login_and_password_errors.dart';
import 'package:domain/model/user_email_pass.dart';
import 'package:domain/model/validation.dart';
import 'package:domain/use_case/use_case.dart';

class ValidationUseCase extends UseCaseParams<UserEmailPass, void> {
  ValidationUseCase({
    required this.loginValidators,
    required this.passwordValidators,
    required this.validationMapper,
  });

  final List<Validation> loginValidators;
  final List<Validation> passwordValidators;
  final ValidationMapper validationMapper;

  @override
  void call(UserEmailPass params) {
    final Validation? loginFailed = loginValidators.firstWhereOrNull(
      (element) => !element.isValid(params.login),
    );
    final Validation? passwordFailed = passwordValidators.firstWhereOrNull(
      (element) => !element.isValid(params.password),
    );

    final ValidationLoginErrorType? loginInvalidType =
        validationMapper.call(loginFailed);

    final ValidationLoginErrorType? passwordInvalidType =
        validationMapper.call(passwordFailed);

    if (loginInvalidType != null && passwordInvalidType != null) {
      throw LoginAndPasswordErrors(
        loginError: loginInvalidType,
        passwordError: passwordInvalidType,
      );
    }
  }
}
