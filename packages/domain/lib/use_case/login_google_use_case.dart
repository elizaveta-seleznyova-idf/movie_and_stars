import 'package:domain/model/user_email_pass.dart';
import 'package:domain/repository/preference_local_repository.dart';
import 'package:domain/use_case/use_case.dart';

import '../repository/auth_repository.dart';

class LoginGoogleUseCase implements UseCase<Future<bool>> {
  const LoginGoogleUseCase(
    this._authRepository,
    this._preferences,
  );

  final AuthRepository _authRepository;
  final PreferencesLocalRepository _preferences;

  @override
  Future<bool> call() async {
    final UserEmailPass? user = await _authRepository.loginWithGoogle();
    if (user == null) {
      return false;
    }
    final List<UserEmailPass> users = await _authRepository.fetchUsers();
    final isAbleToLogin = users.any(
      (element) =>
          element.login == user.login && element.password == user.password,
    );
    if (isAbleToLogin) await _preferences.saveLoggedUser(user);
    return isAbleToLogin;
  }
}