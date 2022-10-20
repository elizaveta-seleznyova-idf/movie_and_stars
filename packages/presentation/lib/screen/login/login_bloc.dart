import 'package:domain/enum/error_type.dart';
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
import 'package:presentation/utils/error_message.dart';

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
    } else {
      return null;
    }
  }

  @override
  void onChangedLogin(String changeLogin) {
    _loginScreenFormKey.currentState?.validate();
    _loginText = changeLogin;

    _loginValidation = null;
  }

  @override
  void onChangedPassword(String changeLogin) {
    _loginScreenFormKey.currentState?.validate();
    _passwordText = changeLogin;
    passwordValidation = null;
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
      _loginText,
      _passwordText,
    );
    final LoginAndPasswordErrors? loginAndPasswordErrors =
        validationUseCase(user);
    _loginValidation = loginAndPasswordErrors?.loginError;
    _passwordValidation = loginAndPasswordErrors?.passwordError;

    final result = await loginWithEmailAndPass(user);
    if (result.loginError == null && result.passwordError == null) {
      _tryLogin(true);
    } else {
      _loginValidation = result.loginError;
      _passwordValidation = result.passwordError;
      _loginScreenFormKey.currentState?.validate();
    }

    _updateData(data: _stateData, isLoading: false);
  }

  @override
  Future<void> logFacebook() async {
    await logAnalyticsEventUseCase(
      AnalyticsEventConstants.eventLoginLogFacebook,
    );
    _tryLogin(await loginFaceBookUseCase());
  }

  @override
  Future<void> logGoogle() async {
    await logAnalyticsEventUseCase(
      AnalyticsEventConstants.eventLoginLogGoogle,
    );
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
      data: _stateData.copyWith(errorMessage: ErrorMessage.fail_while_loggin),
      isLoading: false,
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
