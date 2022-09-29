import 'package:flutter/material.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/home/model/movie_model.dart';

class MovieDetailsScreenArguments extends BaseArguments {
  final MovieModel movieInfo;

  MovieDetailsScreenArguments({
    required this.movieInfo,
    Function(dynamic value)? result,
  }) : super(result: result);
}

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  static const _routeName = '/MovieDetailsScreen';

  static BasePage page(MovieDetailsScreenArguments arguments) => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const MovieDetailsScreen(),
        showSlideAnim: true,
        arguments: arguments,
        isButtonNavBarActive: true,
      );

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorsDark.primaryColorDark,
        elevation: Dimens.size0,
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.shortcut,
              size: Dimens.size35,
            ),
          ),
          const SizedBox(width: Dimens.size18)
        ],
      ),
      body: const Center(
        child: Text('Some information about movie will be here'),
      ),
    );
  }
}
