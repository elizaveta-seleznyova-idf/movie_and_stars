import 'package:flutter/material.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/screen/home/widgets/shimmer_container.dart';
import 'package:shimmer/shimmer.dart';

class DetailsShimmer extends StatelessWidget {
  const DetailsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: AppColorsDark.primaryColor,
        highlightColor: AppColorsDark.primaryGradientEnd,
        child: Column(
          children: [
            ShimmerContainer(
              shimmerHeight: Dimens.size200,
              shimmerWidth: width,
            ),
            const ShimmerContainer(
              shimmerHeight: Dimens.size150,
              shimmerWidth: 180,
            ),
            const SizedBox(
              height: Dimens.size32,
            ),
            const ShimmerContainer(
              shimmerHeight: Dimens.size18,
              shimmerWidth: Dimens.size262,
            ),
            const SizedBox(
              height: Dimens.size16,
            ),
            const ShimmerContainer(
              shimmerHeight: Dimens.size18,
              shimmerWidth: Dimens.size87,
            ),
            const SizedBox(
              height: Dimens.size9,
            ),
            const ShimmerContainer(
              shimmerHeight: Dimens.size18,
              shimmerWidth: Dimens.size150,
            ),
            const SizedBox(
              height: Dimens.size29,
            ),
            const ShimmerContainer(
              shimmerHeight: Dimens.size20,
              shimmerWidth: Dimens.size200,
            ),
            const SizedBox(
              height: Dimens.size40,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.size18,
                right: Dimens.size17,
              ),
              child: Column(
                children: [
                  ShimmerContainer(
                    shimmerHeight: Dimens.size36,
                    shimmerWidth: width,
                  ),
                  const SizedBox(
                    height: Dimens.size35,
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: ShimmerContainer(
                      shimmerHeight: Dimens.size18,
                      shimmerWidth: Dimens.size80,
                    ),
                  ),
                  const SizedBox(height: Dimens.size16),
                  ShimmerContainer(
                    shimmerHeight: Dimens.size100,
                    shimmerWidth: width,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
