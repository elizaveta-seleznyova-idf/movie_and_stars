import 'package:domain/enum/login_error_type.dart';
import 'package:domain/model/login_and_password_errors_model.dart';
import 'package:domain/model/user_email_pass.dart';
import 'package:domain/use_case/login_email_and_password_use_case.dart';
import 'package:domain/use_case/login_facebook_use_case.dart';
import 'package:domain/use_case/login_google_use_case.dart';
import 'package:domain/use_case/validation_use_case.dart';
import 'package:flutter/material.dart';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/generated_localization/l10n.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/screen/login/login_data.dart';
import 'package:presentation/screen/profile/profile_screen.dart';

import 'package:presentation/utils/analytics_constants.dart';

abstract class LoginBloc extends Bloc<BaseArguments, LoginData> {
  factory LoginBloc(
    LoginEmailAndPassUseCase loginWithEmailAndPass,
    LoginGoogleUseCase loginGoogleUseCase,
    LoginFaceBookUseCase loginFaceBookUseCase,
    ValidationUseCase validationUseCase,
  ) =>
      _LoginBloc(
        loginWithEmailAndPass,
        loginGoogleUseCase,
        loginFaceBookUseCase,
        validationUseCase,
      );

  TextEditingController get textLoginController;

  TextEditingController get textPasswordController;

  GlobalKey get loginScreenFormKey;

  String? validateLogin(String? textLogin);

  String? validatePassword(String? textPassword);

  void onChangedLogin(String changeLogin);

  void onChangedPassword(String changeLogin);

  Future<void> login();

  Future<void> logGoogle();

  Future<void> logFacebook();
}

class _LoginBloc extends BlocImpl<BaseArguments, LoginData>
    implements LoginBloc {
  _LoginBloc(
    this.loginWithEmailAndPass,
    this.loginGoogleUseCase,
    this.loginFaceBookUseCase,
    this.validationUseCase,
  );

  LoginData _stateData = LoginData.init();

  final LoginEmailAndPassUseCase loginWithEmailAndPass;
  final LoginGoogleUseCase loginGoogleUseCase;
  final LoginFaceBookUseCase loginFaceBookUseCase;
  final ValidationUseCase validationUseCase;

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _loginScreenFormKey = GlobalKey<FormState>();

  @override
  TextEditingController get textLoginController => _loginController;

  @override
  TextEditingController get textPasswordController => _passwordController;

  @override
  GlobalKey get loginScreenFormKey => _loginScreenFormKey;

  ValidationLoginErrorType? _loginValidation;
  ValidationLoginErrorType? _passwordValidation;

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
  String? validateLogin(String? textLogin) {
    if (_loginValidation == ValidationLoginErrorType.requiredErrorType) {
      return SM.current.loginFieldRequired;
    } else if (_loginValidation == ValidationLoginErrorType.minLengthErrorType) {
      return SM.current.loginFieldInvalid;
    } else if (_loginValidation == ValidationLoginErrorType.userNotExist) {
      return SM.current.loginFieldRequired;
    } else {
      return null;
    }
  }

  @override
  String? validatePassword(String? textPassword) {
    if (_passwordValidation == ValidationLoginErrorType.requiredErrorType) {
      return SM.current.passwordFieldRequired;
    } else if (_passwordValidation == ValidationLoginErrorType.regexErrorType) {
      return SM.current.passwordFieldInvalid;
    } else if (_passwordValidation == ValidationLoginErrorType.userNotExist) {
      return SM.current.loginFieldRequired;
    } else {
      return null;
    }
  }

  @override
  void onChangedLogin(String changeLogin) {
    _stateData.loginText = changeLogin;
    _loginValidation = null;
    _loginScreenFormKey.currentState?.validate();
  }

  @override
  void onChangedPassword(String changeLogin) {
    _stateData.passwordText = changeLogin;
    _passwordValidation = null;
    _loginScreenFormKey.currentState?.validate();
  }

  @override
  Future<void> login() async {
    _updateData(
      data: _stateData,
      isLoading: false,
    );
    _updateData(data: _stateData, isLoading: true);
    await logAnalyticsEventUseCase(
      AnalyticsEventConstants.eventLoginLogPassword,
    );
    final UserEmailPass user = UserEmailPass(
      _stateData.loginText,
      _stateData.passwordText,
    );
    try {
      validationUseCase(user);
      await loginWithEmailAndPass(user);
      _pushToProfile();
    } on LoginAndPasswordErrors catch (e) {
      _loginValidation = e.loginError;
      _passwordValidation = e.passwordError;
      _loginScreenFormKey.currentState?.validate();
      _updateData(data: _stateData, isLoading: false);
    }
  }

  @override
  Future<void> logFacebook() async {
    await logAnalyticsEventUseCase(
      AnalyticsEventConstants.eventLoginLogFacebook,
    );
    try {
      await loginFaceBookUseCase();
      _pushToProfile();
    } on LoginAndPasswordErrors catch (e) {
      _loginValidation = e.loginError;
      _passwordValidation = e.passwordError;
      _loginScreenFormKey.currentState?.validate();
    }
  }

  @override
  Future<void> logGoogle() async {
    await logAnalyticsEventUseCase(
      AnalyticsEventConstants.eventLoginLogGoogle,
    );
    try {
      await loginGoogleUseCase();
      _pushToProfile();
    } on LoginAndPasswordErrors catch (e) {
      _loginValidation = e.loginError;
      _passwordValidation = e.passwordError;
      _loginScreenFormKey.currentState?.validate();
    }
  }

  void _pushToProfile() {
    appNavigator.push(ProfileScreen.page(ProfileScreenArguments()));
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
