import 'package:flutter/material.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String _textFontFamily ='SF Pro Text';

  static const TextStyle sfProRegular30px = TextStyle(
    fontFamily: _textFontFamily,
    fontSize: Dimens.size30,
  );

  static const TextStyle sfProMedium18px = TextStyle(
    fontFamily: _textFontFamily,
    fontSize: Dimens.size18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle sfProSemiBold24px = TextStyle(
    fontFamily: _textFontFamily,
    fontSize: Dimens.size24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle sfProRegularUnselected16px = TextStyle(
    color: AppColorsDark.unselectedColor,
    fontFamily: _textFontFamily,
    fontSize: Dimens.size16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle sfProRegularUnselected14px = TextStyle(
    color: AppColorsDark.unselectedColor,
    fontFamily: _textFontFamily,
    fontSize: Dimens.size14,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle sfProRegularSelected14px = TextStyle(
    color: AppColorsDark.selectedItem,
    fontFamily: _textFontFamily,
    fontSize: Dimens.size14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle sfProMedium14px = TextStyle(
    fontFamily: _textFontFamily,
    fontSize: Dimens.size14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle sfProMediumUnselected12px = TextStyle(
    color: AppColorsDark.unselectedColor,
    fontFamily: _textFontFamily,
    fontSize: Dimens.size12,
    fontWeight: FontWeight.w500,
  );
}
