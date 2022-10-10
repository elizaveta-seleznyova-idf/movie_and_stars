import 'package:domain/model/user_email_pass.dart';
import 'package:domain/use_case/analytics_use_case.dart';
import 'package:domain/use_case/login_email_and_password_use_case.dart';
import 'package:domain/use_case/login_facebook_use_case.dart';
import 'package:domain/use_case/login_google_use_case.dart';
import 'package:flutter/material.dart';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/screen/login/validation.dart';
import 'package:presentation/screen/profile/profile_screen.dart';

import 'login_data.dart';

abstract class LoginBloc extends Bloc<BaseArguments, LoginData> {
  factory LoginBloc(
    LoginEmailAndPassUseCase loginWithEmailAndPass,
    LoginGoogleUseCase loginGoogleUseCase,
    LoginFaceBookUseCase loginFaceBookUseCase,
      AnalyticsUseCase analyticsUseCase,
  ) =>
      _LoginBloc(
        loginWithEmailAndPass,
        loginGoogleUseCase,
        loginFaceBookUseCase,
        analyticsUseCase,
      );

  TextEditingController get textLoginController;

  TextEditingController get textPasswordController;

  Future<void> auth();

  Future<void> authGoogle();

  Future<void> authFacebook();
}

class _LoginBloc extends BlocImpl<BaseArguments, LoginData>
    implements LoginBloc {
  _LoginBloc(
    this.loginWithEmailAndPass,
    this.loginGoogleUseCase,
    this.loginFaceBookUseCase,
    this.analytics,
  );

  LoginData _stateData = LoginData.init();

  final LoginEmailAndPassUseCase loginWithEmailAndPass;
  final LoginGoogleUseCase loginGoogleUseCase;
  final LoginFaceBookUseCase loginFaceBookUseCase;
  final AnalyticsUseCase analytics;

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  TextEditingController get textLoginController => _loginController;

  @override
  TextEditingController get textPasswordController => _passwordController;

  @override
  void initState() async {
    super.initState();
    _updateData(data: _stateData);
  }

  _updateData({
    LoginData? data,
    bool? isLoading,
  }) {
    handleData(
      data: data,
      isLoading: isLoading,
    );
  }

  @override
  Future<void> auth() async {
    final login = _loginController.text;
    final password = _passwordController.text;

    _updateData(
      data: _stateData,
      isLoading: false,
    );
    if (Validation(login, password).isValid()) {
      _updateData(
        data:
            _stateData.copyWith(errorMessage: 'Fill in your login or password'),
      );
      return;
    }
    _updateData(data: _stateData, isLoading: true);
    analytics('on_login_click');
    final UserEmailPass user = UserEmailPass(login, password);
    _tryLogin(await loginWithEmailAndPass(user));
    _updateData(data: _stateData, isLoading: false);
  }

  @override
  Future<void> authFacebook() async {
    analytics('on_facebook_click');
    _tryLogin(await loginFaceBookUseCase());
  }

  @override
  Future<void> authGoogle() async {
    analytics('on_google_click');
    _tryLogin(await loginGoogleUseCase());
  }

  void _tryLogin(bool isAbleToLogin) {
    if (isAbleToLogin) {
      appNavigator.push(
        ProfileScreen.page(
          ProfileScreenArguments(),
        ),
      );
      return;
    }
    _updateData(
      data: _stateData.copyWith(errorMessage: 'Fail while logging'),
      isLoading: false,
    );
  }
}
