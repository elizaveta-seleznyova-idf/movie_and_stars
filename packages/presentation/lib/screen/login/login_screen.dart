import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/generated_localization/l10n.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/login/login_bloc.dart';
import 'package:presentation/screen/login/login_data.dart';
import 'package:presentation/screen/login/widgets/login_registration_button.dart';
import 'package:presentation/screen/login/widgets/login_text_field.dart';
import 'package:presentation/utils/image_path.dart';

class LoginScreenArguments extends BaseArguments {
  LoginScreenArguments({super.result});
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const _routeName = '/LoginScreen';

  static BasePage page(LoginScreenArguments arguments) => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const LoginScreen(),
        showSlideAnim: true,
        arguments: arguments,
        isButtonNavBarActive: true,
      );

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends BlocScreenState<LoginScreen, LoginBloc> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return StreamBuilder<BlocData<LoginData?>>(
      stream: bloc.dataStream,
      builder: (_, snapshot) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColorsDark.primaryColorDark,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(Dimens.size1),
              child: Container(
                color: AppColorsDark.borderTabBar,
                height: Dimens.size1,
              ),
            ),
            elevation: Dimens.size0,
            title: Padding(
              padding: const EdgeInsets.only(
                left: Dimens.size12,
              ),
              child: Text(
                SM.current.profile,
                style: AppTextStyles.sfProSemiBold24px,
              ),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.size26),
              child: Form(
                key: bloc.loginScreenFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      SM.current.userName,
                      style: AppTextStyles.sfProMediumUnselected12px,
                    ),
                    const SizedBox(height: Dimens.size8),
                    LoginTextField(
                      controller: bloc.textLoginController,
                      onChanged: bloc.onChangedLogin,
                      validator: bloc.validateLogin,
                      prefixIcon: SvgPicture.asset(
                        ImagesPath.profileImage,
                        width: Dimens.size18,
                        height: Dimens.size18,
                        fit: BoxFit.none,
                      ),
                      isSuffixIcon: false,
                    ),
                    // TextFormField(
                    //   controller: bloc.textLoginController,
                    //   cursorColor: Colors.white,
                    //   style: const TextStyle(
                    //     color: AppColorsDark.unselectedColor,
                    //   ),
                    //   onChanged: bloc.onChangedLogin,
                    //   validator: (_) => bloc.validateLogin(),
                    //   decoration: InputDecoration(
                    //     prefixIcon: SvgPicture.asset(
                    //       ImagesPath.profileImage,
                    //       width: Dimens.size18,
                    //       height: Dimens.size18,
                    //       fit: BoxFit.none,
                    //     ),
                    //     filled: true,
                    //     fillColor: AppColorsDark.secondaryColor,
                    //     contentPadding: const EdgeInsets.symmetric(
                    //       horizontal: Dimens.size10,
                    //     ),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(Dimens.size4),
                    //       borderSide: const BorderSide(
                    //         width: Dimens.size0,
                    //         style: BorderStyle.none,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: Dimens.size16),
                    Text(
                      SM.current.password,
                      style: AppTextStyles.sfProMediumUnselected12px,
                    ),
                    const SizedBox(height: Dimens.size8),
                    LoginTextField(
                      controller: bloc.textPasswordController,
                      onChanged: bloc.onChangedPassword,
                      validator: bloc.validatePassword,
                      prefixIcon: SvgPicture.asset(
                        ImagesPath.lockImage,
                        width: Dimens.size18,
                        height: Dimens.size18,
                        fit: BoxFit.none,
                      ),
                      isSuffixIcon: true,
                    ),
                    // TextFormField(
                    //   controller: bloc.textPasswordController,
                    //   obscureText: !_passwordVisible,
                    //   autocorrect: false,
                    //   enableSuggestions: false,
                    //   cursorColor: Colors.white,
                    //   style: const TextStyle(
                    //     color: AppColorsDark.unselectedColor,
                    //   ),
                    //   onChanged: bloc.onChangedPassword,
                    //   validator: (_) => bloc.validatePassword(),
                    //   decoration: InputDecoration(
                    //     prefixIcon: SvgPicture.asset(
                    //       ImagesPath.lockImage,
                    //       width: Dimens.size18,
                    //       height: Dimens.size18,
                    //       fit: BoxFit.none,
                    //     ),
                    //     suffixIcon: IconButton(
                    //       icon: Icon(
                    //         _passwordVisible
                    //             ? Icons.visibility
                    //             : Icons.visibility_off,
                    //         color: Theme.of(context).primaryColorDark,
                    //       ),
                    //       onPressed: () {
                    //         setState(() {
                    //           _passwordVisible = !_passwordVisible;
                    //         });
                    //       },
                    //     ),
                    //     filled: true,
                    //     fillColor: AppColorsDark.secondaryColor,
                    //     contentPadding: const EdgeInsets.symmetric(
                    //       horizontal: Dimens.size10,
                    //     ),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(Dimens.size4),
                    //       borderSide: const BorderSide(
                    //         width: Dimens.size0,
                    //         style: BorderStyle.none,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: Dimens.size32),
                    SizedBox(
                      width: width,
                      height: Dimens.size48,
                      child: ElevatedButton(
                        onPressed: bloc.login,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            AppColorsDark.primaryColor,
                          ),
                        ),
                        child: Text(
                          SM.current.login,
                          style: AppTextStyles.sfProRegularUnselected16px,
                        ),
                      ),
                    ),
                    const SizedBox(height: Dimens.size50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginRegistrationButton(
                          onPressed: bloc.logFacebook,
                          buttonImage: ImagesPath.facebookImage,
                          buttonColor: AppColorsDark.facebookColor,
                        ),
                        const SizedBox(width: Dimens.size24),
                        LoginRegistrationButton(
                          onPressed: bloc.logGoogle,
                          buttonImage: ImagesPath.googleImage,
                          buttonColor: AppColorsDark.googleColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
