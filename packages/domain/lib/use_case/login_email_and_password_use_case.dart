import 'package:domain/enum/login_error_type.dart';
import 'package:domain/model/login_and_password_errors.dart';
import 'package:domain/model/user_email_pass.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/repository/preference_local_repository.dart';
import 'package:domain/use_case/use_case.dart';

class LoginEmailAndPassUseCase
    implements UseCaseParams<UserEmailPass, Future<void>> {
  const LoginEmailAndPassUseCase(
    this._authRepository,
    this._preferences,
  );

  final AuthRepository _authRepository;
  final PreferencesLocalRepository _preferences;

  @override
  Future<void> call(UserEmailPass user) async {
    final isAbleToLogin = await _authRepository.isUserExist(user);
    if (isAbleToLogin) {
      await _preferences.saveLoggedUser(user);
    } else {
      throw LoginAndPasswordErrors(
        loginError: ValidationLoginErrorType.userNotExist,
        passwordError: ValidationLoginErrorType.userNotExist,
      );
    }
  }
}
