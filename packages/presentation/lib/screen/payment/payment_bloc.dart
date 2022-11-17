import 'package:flutter/material.dart';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/screen/payment/payment_data.dart';

abstract class PaymentBloc extends Bloc<BaseArguments, PaymentData> {
  factory PaymentBloc() => _TicketsBloc();

  TextEditingController get phoneNumberController;

  TextEditingController get cardNumberController;

  TextEditingController get dateExpireController;

  TextEditingController get cvvController;

  GlobalKey get ticketsScreenFormKey;

  // String? validateLogin(String? textLogin);
  //
  // String? validatePassword(String? textPassword);

  // String? validateLogin(String? textLogin);
  //
  // String? validatePassword(String? textPassword);
  //
  // void onChangedLogin(String changeLogin);
  //
  // void onChangedPassword(String changeLogin);
  //
  // void onChangedLogin(String changeLogin);
  //
  // void onChangedPassword(String changeLogin);

  Future<void> placeOrder();
}

class _TicketsBloc extends BlocImpl<BaseArguments, PaymentData>
    implements PaymentBloc {
  _TicketsBloc();

  final TextEditingController _phoneNumberController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _dateExpireController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final GlobalKey<FormState> _ticketsScreenFormKey = GlobalKey<FormState>();

  @override
  TextEditingController get phoneNumberController =>
      _phoneNumberController;

  @override
  TextEditingController get cardNumberController => _cardNumberController;

  @override
  TextEditingController get dateExpireController => _dateExpireController;

  @override
  TextEditingController get cvvController => _cvvController;

  @override
  GlobalKey get ticketsScreenFormKey => _ticketsScreenFormKey;

  @override
  Future<void> placeOrder() {
    // TODO: implement placeOrder
    throw UnimplementedError();
  }

  // @override
  // String? validateLogin(String? textLogin) {
  //   if (_loginValidation == ValidationErrorType.requiredErrorType) {
  //     return SM.current.loginFieldRequired;
  //   } else if (_loginValidation == ValidationErrorType.minLengthErrorType) {
  //     return SM.current.loginFieldInvalid;
  //   } else if (_loginValidation == ValidationErrorType.userNotExist) {
  //     return SM.current.loginFieldRequired;
  //   } else {
  //     return null;
  //   }
  // }
  //
  // @override
  // String? validatePassword(String? textPassword) {
  //   if (_passwordValidation == ValidationErrorType.requiredErrorType) {
  //     return SM.current.passwordFieldRequired;
  //   } else if (_passwordValidation == ValidationErrorType.regexErrorType) {
  //     return SM.current.passwordFieldInvalid;
  //   } else if (_passwordValidation == ValidationErrorType.userNotExist) {
  //     return SM.current.loginFieldRequired;
  //   } else {
  //     return null;
  //   }
  // }
  //
  // @override
  // String? validateLogin(String? textLogin) {
  //   if (_loginValidation == ValidationErrorType.requiredErrorType) {
  //     return SM.current.loginFieldRequired;
  //   } else if (_loginValidation == ValidationErrorType.minLengthErrorType) {
  //     return SM.current.loginFieldInvalid;
  //   } else if (_loginValidation == ValidationErrorType.userNotExist) {
  //     return SM.current.loginFieldRequired;
  //   } else {
  //     return null;
  //   }
  // }
  //
  // @override
  // String? validatePassword(String? textPassword) {
  //   if (_passwordValidation == ValidationErrorType.requiredErrorType) {
  //     return SM.current.passwordFieldRequired;
  //   } else if (_passwordValidation == ValidationErrorType.regexErrorType) {
  //     return SM.current.passwordFieldInvalid;
  //   } else if (_passwordValidation == ValidationErrorType.userNotExist) {
  //     return SM.current.loginFieldRequired;
  //   } else {
  //     return null;
  //   }
  // }
  //
  // @override
  // void onChangedLogin(String changeLogin) {
  //   _stateData.loginText = changeLogin;
  //   _loginValidation = null;
  //   _loginScreenFormKey.currentState?.validate();
  // }
  //
  // @override
  // void onChangedPassword(String changeLogin) {
  //   _stateData.passwordText = changeLogin;
  //   _passwordValidation = null;
  //   _loginScreenFormKey.currentState?.validate();
  // }
  //
  // @override
  // void onChangedLogin(String changeLogin) {
  //   _stateData.loginText = changeLogin;
  //   _loginValidation = null;
  //   _loginScreenFormKey.currentState?.validate();
  // }
  //
  // @override
  // void onChangedPassword(String changeLogin) {
  //   _stateData.passwordText = changeLogin;
  //   _passwordValidation = null;
  //   _loginScreenFormKey.currentState?.validate();
  // }
  //
  // @override
  // Future<void> login() async {
  //   _updateData(
  //     data: _stateData,
  //     isLoading: false,
  //   );
  //   _updateData(data: _stateData, isLoading: true);
  //   await logAnalyticsEventUseCase(
  //     AnalyticsEventConstants.eventLoginLogPassword,
  //   );
  //   final UserEmailPass user = UserEmailPass(
  //     _stateData.loginText,
  //     _stateData.passwordText,
  //   );
  //   try {
  //     validationUseCase(user);
  //     await loginWithEmailAndPass(user);
  //     _pushToProfile();
  //   } on LoginAndPasswordErrors catch (e) {
  //     _loginValidation = e.loginError;
  //     _passwordValidation = e.passwordError;
  //     _loginScreenFormKey.currentState?.validate();
  //     _updateData(data: _stateData, isLoading: false);
  //   }
  // }

}
