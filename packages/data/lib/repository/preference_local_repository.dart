import 'package:domain/model/user_email_pass.dart';
import 'package:domain/repository/movie_database_local_repository.dart';
import 'package:domain/repository/preference_local_repository.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesLocalRepositoryImpl implements PreferencesLocalRepository {
  const PreferencesLocalRepositoryImpl({
    required this.sharedPreferences,
    required this.movieDBLocalRepository,
  });

  final SharedPreferences sharedPreferences;
  final MovieDBLocalRepository movieDBLocalRepository;

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
      if (convertedDateResponse.isAfter(convertedSavedData)) {
        final stringDate = convertedDateResponse.toString();

        await sharedPreferences.setString(_dateKey, stringDate);
        return false;
      } else {
        return true;
      }
    }
  }

  DateTime convertStringToDate(String date) {
    DateTime parseDate =
        DateFormat("EEE, d MMM yyyy HH:mm:ss", 'en').parse(date);
    return parseDate;
  }

  DateTime convertSavedDateToDate(String date) {
    DateTime convertedDate = DateTime.parse(date);
    return convertedDate;
  }
}
