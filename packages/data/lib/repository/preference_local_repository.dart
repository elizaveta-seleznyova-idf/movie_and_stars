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
  Future<void> saveDate(String date) async {
    final convertedDateResponse = convertStringToDate(date);
    print('DATE!!!! $convertedDateResponse');
    final savedDate = sharedPreferences.getString(_dateKey);
    if (savedDate == null) {
      await sharedPreferences.setString(
          _dateKey, convertedDateResponse.toString());
    } else {
      final convertedSavedData = convertSavedDateToDate(savedDate);
      print('DATE SHARED PREFERENCE $savedDate CONVERT TO $convertedSavedData');
      if (convertedDateResponse.isAfter(convertedSavedData)) {
        ///ADD UPDATE METHOD
        final stringDate = convertedDateResponse.toString();

        await sharedPreferences.setString(_dateKey, stringDate);
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
