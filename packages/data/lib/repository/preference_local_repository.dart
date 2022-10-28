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
    final savedDate = sharedPreferences.getString(_dateKey);
    if (savedDate == null) {
      await sharedPreferences.setString(
          _dateKey, convertedDateResponse.toString());
      print('PREFERENCE DATE FIRST');
    } else {
      final convertedSavedData = convertStringToDate(savedDate);
      if (convertedDateResponse.isAfter(convertedSavedData)) {
        ///ADD UPDATE METHOD
        final stringDate = convertedDateResponse.toString();

        await sharedPreferences.setString(_dateKey, stringDate);
        print('PREFERENCE DATE AFTER');
      }
    }
  }

  DateTime convertStringToDate(String date) {
    //date: Fri, 28 Oct 2022 08:29:58 GMT
    DateTime parseDate =
        DateFormat("EEE, d MMM yyyy HH:mm:ss", 'en').parse(date);
    //DateTime convertedData = DateTime.parse(parseDate);
    return parseDate;
  }


}
