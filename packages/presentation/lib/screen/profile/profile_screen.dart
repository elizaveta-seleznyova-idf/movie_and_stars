import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/profile/profile_bloc.dart';

class ProfileScreenArguments extends BaseArguments {
  ProfileScreenArguments({
    super.result,
  });
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const _routeName = '/ProfileScreen';

  static BasePage page(ProfileScreenArguments arguments) => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const ProfileScreen(),
        showSlideAnim: true,
        arguments: arguments,
        isButtonNavBarActive: true,
      );

  @override
  State createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BlocScreenState<ProfileScreen, ProfileBloc> {
  @override
  Widget build(BuildContext context) {
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
            AppLocalizations.of(context)!.profile,
            style: AppTextStyles.sfProSemiBold24px,
          ),
        ),
      ),
      body: const Center(
        child: Text('You are logged!'),
      ),
    );
  }
}
