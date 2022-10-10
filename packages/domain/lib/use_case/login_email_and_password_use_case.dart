import 'package:domain/model/user_email_pass.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:domain/repository/preference_local_repository.dart';
import 'package:domain/use_case/use_case.dart';

class LoginEmailAndPassUseCase
    implements UseCaseParams<UserEmailPass, Future<bool>> {
  const LoginEmailAndPassUseCase(
    this._authRepository,
    this._preferences,
  );

  final AuthRepository _authRepository;
  final PreferencesLocalRepository _preferences;

  @override
  Future<bool> call(UserEmailPass user) async {
    final isAbleToLogin = await _authRepository.userExistenceCheck(user);
    if (isAbleToLogin) await _preferences.saveLoggedUser(user);
    return isAbleToLogin;
  }
}
