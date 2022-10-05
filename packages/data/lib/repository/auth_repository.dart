import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/model/user_email_pass.dart';
import 'package:domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(
    this.firebaseAuth,
    this.firebaseFirestore,
    this.facebookAuth,
  );

  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FacebookAuth facebookAuth;
  static const _usersCollection = 'movies_and_stars';

  @override
  Future<List<UserEmailPass>> fetchUsers() async {
    final users = await firebaseFirestore.collection(_usersCollection).get();
    return users.docs.map((e) => UserEmailPass.fromJson(e.data())).toList();
  }

  @override
  Future<UserEmailPass?> loginWithFaceBook() async {
    final LoginResult loginResult = await facebookAuth
        .login(permissions: ['email', 'public_profile', 'user_birthday']);
    final user = await facebookAuth.getUserData();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken?.token ?? '');

    firebaseAuth.signInWithCredential(facebookAuthCredential);
    return UserEmailPass(
      user['email'] ?? '',
      user['id'] ?? '',
    );
  }

  @override
  Future<UserEmailPass?> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    if (googleUser == null) return null;
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    firebaseAuth.signInWithCredential(credential);
    return UserEmailPass(
      googleUser.email,
      googleUser.id,
    );
  }
}
