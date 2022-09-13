import 'package:flutter/material.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/navigation/base_page.dart';

class MovieDetailsScreenArguments extends BaseArguments {
  MovieDetailsScreenArguments({
    Function(dynamic value)? result,
  }) : super(result: result);
}

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  static const _routeName = '/MovieDetailsScreen';

  static BasePage page(MovieDetailsScreenArguments arguments) => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const MovieDetailsScreen(),
        showSlideAnim: true,
        arguments: arguments,
      );

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Some information about movie will be here')),
    );
  }
}
