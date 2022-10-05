import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/profile/profile_bloc.dart';

class ProfileScreenArguments extends BaseArguments {
  ProfileScreenArguments({
    Function(dynamic value)? result,
  }) : super(result: result);
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
    return const Scaffold(
      body: Center(
        child: Text('You are logged!'),
      ),
    );
  }
}
