import 'package:flutter/material.dart';
import 'package:presentation/navigation/base_arguments.dart';

class BasePage<T extends BaseArguments> extends Page {
  const BasePage({
    required LocalKey key,
    required String name,
    required this.builder,
    this.showSlideAnim,
    required this.isButtonNavBarActive,
    T? arguments,
  }) : super(
          key: key,
          name: name,
          arguments: arguments,
        );

  final WidgetBuilder builder;
  final bool? showSlideAnim;
  final bool isButtonNavBarActive;

  @override
  Route createRoute(BuildContext context) => _AppRoute(
        settings: this,
        builder: builder,
        showSlideAnim: showSlideAnim == true,
        isButtonNavBarActive: isButtonNavBarActive,
      );

  @override
  String toString() => '$name';
}

class _AppRoute extends MaterialPageRoute {
  final bool showSlideAnim;
  final bool isButtonNavBarActive;

  _AppRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    this.showSlideAnim = false,
    required this.isButtonNavBarActive,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (!showSlideAnim) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    }

    return super.buildTransitions(
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}
