import 'package:flutter/material.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/screen/home/widgets/shimmer_container.dart';
import 'package:shimmer/shimmer.dart';

class DetailsReviewsShimmer extends StatelessWidget {
  const DetailsReviewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimens.size18,
        right: Dimens.size17,
      ),
      child: Shimmer.fromColors(
        baseColor: AppColorsDark.primaryColor,
        highlightColor: AppColorsDark.primaryGradientEnd,
        child: Column(
          children: [
            const SizedBox(height: Dimens.size20),
            ShimmerContainer(
              shimmerHeight: Dimens.size40,
              shimmerWidth: width,
            ),
            const SizedBox(height: Dimens.size25),
            ShimmerContainer(
              shimmerHeight: Dimens.size167,
              shimmerWidth: width,
            ),
            const SizedBox(height: Dimens.size20),
            ShimmerContainer(
              shimmerHeight: Dimens.size40,
              shimmerWidth: width,
            ),
            const SizedBox(height: Dimens.size25),
            ShimmerContainer(
              shimmerHeight: Dimens.size167,
              shimmerWidth: width,
            ),
          ],
        ),
      ),
    );
  }
}
