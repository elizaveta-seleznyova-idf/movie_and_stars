import 'package:domain/model/user_email_pass.dart';

abstract class AuthRepository {
  Future<bool> userExistenceCheck(UserEmailPass user);

  Future<UserEmailPass?> loginWithGoogle();

  Future<UserEmailPass?> loginWithFaceBook();
}