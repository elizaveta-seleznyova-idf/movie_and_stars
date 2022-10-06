import 'package:flutter/material.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/screen/home/widgets/shimmer_container.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    int itemCountLength = 6;
    int crossAxisCountSize = 2;
    int flexSize = 2;

    return Shimmer.fromColors(
      baseColor: AppColorsDark.primaryColor,
      highlightColor: AppColorsDark.primaryGradientEnd,
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.size18),
              itemCount: itemCountLength,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: Dimens.size167 / Dimens.size320,
                crossAxisCount: crossAxisCountSize,
                crossAxisSpacing: Dimens.size2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ShimmerContainer(
                      shimmerHeight: Dimens.size250,
                      shimmerWidth: Dimens.size167,
                    ),
                    const Spacer(),
                    const ShimmerContainer(
                      shimmerHeight: Dimens.size20,
                      shimmerWidth: Dimens.size120,
                    ),
                    const Spacer(),
                    ShimmerContainer(
                      shimmerHeight: Dimens.size15,
                      shimmerWidth: width / Dimens.size3,
                    ),
                    const Spacer(),
                    ShimmerContainer(
                      shimmerHeight: Dimens.size10,
                      shimmerWidth: width / Dimens.size2,
                    ),
                    Spacer(flex: flexSize),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
