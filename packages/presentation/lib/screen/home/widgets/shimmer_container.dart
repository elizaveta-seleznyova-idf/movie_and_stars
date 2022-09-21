import 'package:flutter/material.dart';
import 'package:presentation/config/theme/app_colors.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    Key? key,
    required this.shimmerHeight,
    required this.shimmerWidth,
  }) : super(key: key);

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
          Radius.circular(10),
        ),
      ),
    );
  }
}
