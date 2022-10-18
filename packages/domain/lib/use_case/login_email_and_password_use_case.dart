import 'package:domain/enum/error_type.dart';
import 'package:domain/model/login_and_password_errors_model.dart';
import 'package:domain/model/user_email_pass.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/repository/preference_local_repository.dart';
import 'package:domain/use_case/use_case.dart';
import 'package:domain/use_case/validation_use_case.dart';

class LoginEmailAndPassUseCase
    implements UseCaseParams<UserEmailPass, Future<LoginAndPasswordErrors>> {
  const LoginEmailAndPassUseCase(this._authRepository,
      this._preferences,
      this._validationUseCase,);

  final AuthRepository _authRepository;
  final PreferencesLocalRepository _preferences;
  final ValidationUseCase _validationUseCase;

  @override
  Future<LoginAndPasswordErrors> call(UserEmailPass user) async {
    LoginAndPasswordErrors loginAndPassword = _validationUseCase(user);
    if (loginAndPassword.passwordError == null &&
        loginAndPassword.loginError == null) {
      final isAbleToLogin = await _authRepository.isUserExist(user);
      if (isAbleToLogin) {
        await _preferences.saveLoggedUser(user);
      } else {
        loginAndPassword.passwordError = ValidationErrorType.requiredErrorType;
        loginAndPassword.loginError = ValidationErrorType.requiredErrorType;
      }
    }

    return loginAndPassword;
  }
}
