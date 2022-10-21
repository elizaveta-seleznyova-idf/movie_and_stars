import 'package:domain/enum/error_type.dart';
import 'package:domain/model/login_and_password_errors.dart';
import 'package:domain/model/user_email_pass.dart';
import 'package:domain/use_case/analytics_use_case.dart';
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

abstract class LoginBloc extends Bloc<BaseArguments, LoginData> {
  factory LoginBloc(
    LoginEmailAndPassUseCase loginWithEmailAndPass,
    LoginGoogleUseCase loginGoogleUseCase,
    LoginFaceBookUseCase loginFaceBookUseCase,
    ValidationUseCase validationUseCase,
    AnalyticsUseCase analyticsUseCase,
  ) =>
      _LoginBloc(
        loginWithEmailAndPass,
        loginGoogleUseCase,
        loginFaceBookUseCase,
        validationUseCase,
        analyticsUseCase,
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
    this.analytics,
  );

  LoginData _stateData = LoginData.init();

  final LoginEmailAndPassUseCase loginWithEmailAndPass;
  final LoginGoogleUseCase loginGoogleUseCase;
  final LoginFaceBookUseCase loginFaceBookUseCase;
  final ValidationUseCase validationUseCase;
  final AnalyticsUseCase analytics;

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _loginScreenFormKey = GlobalKey<FormState>();

  @override
  TextEditingController get textLoginController => _loginController;

  @override
  TextEditingController get textPasswordController => _passwordController;

  @override
  GlobalKey get loginScreenFormKey => _loginScreenFormKey;

  ValidationErrorType? _loginValidation;
  ValidationErrorType? _passwordValidation;
  String _loginText = '';
  String _passwordText = '';

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
    if (_loginValidation == ValidationErrorType.requiredErrorType) {
      return SM.current.loginFieldRequired;
    } else if (_loginValidation == ValidationErrorType.minLengthErrorType) {
      return SM.current.loginFieldInvalid;
    } else if (_loginValidation == ValidationErrorType.userNotExist) {
      return SM.current.loginFieldRequired;
    } else {
      return null;
    }
  }

  @override
  String? validatePassword(String? textPassword) {
    if (_passwordValidation == ValidationErrorType.requiredErrorType) {
      return SM.current.passwordFieldRequired;
    } else if (_passwordValidation == ValidationErrorType.regexErrorType) {
      return SM.current.passwordFieldInvalid;
    } else if (_passwordValidation == ValidationErrorType.userNotExist) {
      return SM.current.loginFieldRequired;
    } else {
      return null;
    }
  }

  @override
  void onChangedLogin(String changeLogin) {
    _loginText = changeLogin;
    _loginValidation = null;
    _loginScreenFormKey.currentState?.validate();
  }

  @override
  void onChangedPassword(String changeLogin) {
    _passwordText = changeLogin;
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
    analytics('on_login_click');
    final UserEmailPass user = UserEmailPass(
      _loginText,
      _passwordText,
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
    analytics('on_facebook_click');
    try {
      await loginFaceBookUseCase();
      _pushToProfile();
    } on LoginAndPasswordErrors catch (e)  {
    _loginValidation = e.loginError;
    _passwordValidation = e.passwordError;
    _loginScreenFormKey.currentState?.validate();
    }
  }

  @override
  Future<void> logGoogle() async {
    analytics('on_google_click');
    try {
      await loginGoogleUseCase();
      _pushToProfile();
    } on LoginAndPasswordErrors catch (e)  {
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
