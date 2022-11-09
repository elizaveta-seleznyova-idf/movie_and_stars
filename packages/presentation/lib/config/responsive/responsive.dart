import 'package:flutter/material.dart';
import 'package:presentation/config/dimens/dimens.dart';

class Responsive {
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= Dimens.size500;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < Dimens.size500;


  static int crossAxisCountSize(BuildContext context){
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > Dimens.size1200) {
      return 6;
    } else if (screenWidth > Dimens.size1000) {
      return 5;
    } else if (screenWidth > Dimens.size800) {
      return 4;
    } else if (screenWidth > Dimens.size600) {
      return 3;
    } else {
      return 2;
    }
  }
}
