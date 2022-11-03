import 'package:domain/model/user_email_pass.dart';

abstract class PreferencesLocalRepository {
  Future<void> saveLoggedUser(UserEmailPass user);

  Future<bool> saveDate(String date);
}
