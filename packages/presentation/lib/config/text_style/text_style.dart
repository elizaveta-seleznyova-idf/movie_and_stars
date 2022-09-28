import 'package:flutter/material.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle sfProRegular30px = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: Dimens.size30,
  );

  static const TextStyle sfProMedium18px = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: Dimens.size18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle sfProSemiBold24px = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: Dimens.size24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle sfProRegularUnselected16px = TextStyle(
    color: AppColorsDark.unselectedColor,
    fontFamily: 'SF Pro Text',
    fontSize: Dimens.size16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle sfProRegularUnselected14px = TextStyle(
    color: AppColorsDark.unselectedColor,
    fontFamily: 'SF Pro Text',
    fontSize: Dimens.size14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle sfProMedium14px = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: Dimens.size14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle sfProMediumUnselected12px = TextStyle(
    color: AppColorsDark.unselectedColor,
    fontFamily: 'SF Pro Text',
    fontSize: Dimens.size12,
    fontWeight: FontWeight.w500,
  );
}
