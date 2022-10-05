import 'package:domain/model/user_email_pass.dart';

abstract class AuthRepository {
  Future<List<UserEmailPass>> fetchUsers();

  Future<UserEmailPass?> loginWithGoogle();

  Future<UserEmailPass?> loginWithFaceBook();
}