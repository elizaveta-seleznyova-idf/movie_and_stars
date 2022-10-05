import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/login/login_bloc.dart';
import 'package:presentation/screen/login/login_data.dart';
import 'package:presentation/utils/image_path.dart';

class LoginScreenArguments extends BaseArguments {
  LoginScreenArguments({
    Function(dynamic value)? result,
  }) : super(result: result);
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
                AppLocalizations.of(context)!.profile,
                style: AppTextStyles.sfProSemiBold24px,
              ),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.size26),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.userName,
                    style: AppTextStyles.sfProMediumUnselected12px,
                  ),
                  const SizedBox(height: Dimens.size8),
                  TextField(
                    controller: bloc.textLoginController,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: AppColorsDark.secondaryColor),
                    decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        ImagesPath.profileImage,
                        width: Dimens.size18,
                        height: Dimens.size18,
                        fit: BoxFit.none,
                      ),
                      filled: true,
                      fillColor: AppColorsDark.selectedItem,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Dimens.size10,
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimens.size20),
                  Text(
                    AppLocalizations.of(context)!.password,
                    style: AppTextStyles.sfProMediumUnselected12px,
                  ),
                  const SizedBox(height: Dimens.size8),
                  TextField(
                    controller: bloc.textPasswordController,
                    obscureText: true,
                    autocorrect: false,
                    enableSuggestions: false,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: AppColorsDark.secondaryColor),
                    decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        ImagesPath.lockImage,
                        width: Dimens.size18,
                        height: Dimens.size18,
                        fit: BoxFit.none,
                      ),
                      filled: true,
                      fillColor: AppColorsDark.selectedItem,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Dimens.size10,
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimens.size20),
                  SizedBox(
                    width: width,
                    height: Dimens.size48,
                    child: ElevatedButton(
                      onPressed: bloc.auth,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          AppColorsDark.primaryColor,
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: AppTextStyles.sfProRegularUnselected16px,
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimens.size50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Dimens.size44,
                        height: Dimens.size44,
                        child: ElevatedButton(
                          onPressed: () {
                            bloc.authFacebook();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              AppColorsDark.facebookColor,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  Dimens.size44,
                                ),
                              ),
                            ),
                          ),
                          child: SvgPicture.asset(
                            ImagesPath.facebookImage,
                            width: Dimens.size18,
                            height: Dimens.size18,
                            fit: BoxFit.none,
                          ),
                        ),
                      ),
                      const SizedBox(width: Dimens.size24),
                      SizedBox(
                        width: Dimens.size44,
                        height: Dimens.size44,
                        child: ElevatedButton(
                          onPressed: () {
                            bloc.authGoogle();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              AppColorsDark.googleColor,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  Dimens.size44,
                                ),
                              ),
                            ),
                          ),
                          child: SvgPicture.asset(
                            ImagesPath.googleImage,
                            width: Dimens.size44,
                            height: Dimens.size44,
                            fit: BoxFit.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
