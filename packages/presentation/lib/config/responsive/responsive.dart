import 'package:flutter/material.dart';
import 'package:presentation/config/dimens/dimens.dart';

class Responsive {
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= Dimens.size500;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < Dimens.size500;

  static bool isLargerDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > Dimens.size800;
}
