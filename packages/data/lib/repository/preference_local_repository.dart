import 'package:domain/model/user_email_pass.dart';
import 'package:domain/repository/preference_local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesLocalRepositoryImpl implements PreferencesLocalRepository {
  const PreferencesLocalRepositoryImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  static const _loginKey = 'loggedUserEmail';
  static const _passwordKey = 'loggedUserPassword';
  static const _dateKey = 'dateKey';

  @override
  Future<void> saveLoggedUser(UserEmailPass user) async {
    Future.wait([
      sharedPreferences.setString(_loginKey, user.login),
      sharedPreferences.setString(_passwordKey, user.password)
    ]);
  }

  @override
  Future<void> saveDate(int date) async {
    await sharedPreferences.setInt(_dateKey, date);
  }
}
