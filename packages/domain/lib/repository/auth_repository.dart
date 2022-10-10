import 'package:domain/model/user_email_pass.dart';

abstract class AuthRepository {
  Future<bool> isUserExist(UserEmailPass user);

  Future<UserEmailPass?> loginWithGoogle();

  Future<UserEmailPass?> loginWithFaceBook();
}