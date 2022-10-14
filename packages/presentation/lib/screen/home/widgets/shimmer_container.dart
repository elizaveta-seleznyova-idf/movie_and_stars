import 'package:flutter/material.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/theme/app_colors.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    required this.shimmerHeight,
    required this.shimmerWidth,
    super.key,
  });

  final double shimmerHeight;
  final double shimmerWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: shimmerHeight,
      width: shimmerWidth,
      decoration: const BoxDecoration(
        color: AppColorsDark.borderTabBar,
        borderRadius: BorderRadius.all(
          Radius.circular(Dimens.size10),
        ),
      ),
    );
  }
}
