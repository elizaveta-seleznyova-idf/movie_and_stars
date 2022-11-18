import 'package:data/mapper/convert_date_mappers.dart';
import 'package:domain/model/user_email_pass.dart';
import 'package:domain/repository/movie_database_local_repository.dart';
import 'package:domain/repository/preference_local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesLocalRepositoryImpl implements PreferencesLocalRepository {
  const PreferencesLocalRepositoryImpl({
    required this.sharedPreferences,
    required this.convertStringToDate,
    required this.convertSavedDateToDate,
  });

  final SharedPreferences sharedPreferences;
  final ConvertStringToDate convertStringToDate;
  final ConvertSavedDateToDate convertSavedDateToDate;

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
  Future<bool> saveDate(String date) async {
    final convertedDateResponse = convertStringToDate(date);
    final savedDate = sharedPreferences.getString(_dateKey);
    if (savedDate == null) {
      await sharedPreferences.setString(
          _dateKey, convertedDateResponse.toString());
      return true;
    } else {
      final convertedSavedData = convertSavedDateToDate(savedDate);
      final differenceBetweenDates =
          (convertedDateResponse.difference(convertedSavedData)).inDays;

      if (differenceBetweenDates != 0 && differenceBetweenDates > 0) {
        final stringDate = convertedDateResponse.toString();

        await sharedPreferences.setString(_dateKey, stringDate);
        return true;
      } else {
        return false;
      }
    }
  }
}
