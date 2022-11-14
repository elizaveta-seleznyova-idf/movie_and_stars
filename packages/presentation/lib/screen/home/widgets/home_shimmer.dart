import 'package:flutter/material.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/responsive/responsive.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/screen/home/widgets/shimmer_container.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  static const int itemCountLength = 10;

  static const int flexSize = 2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Shimmer.fromColors(
      baseColor: AppColorsDark.primaryColor,
      highlightColor: AppColorsDark.primaryGradientEnd,
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.size18),
              itemCount: itemCountLength,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: Dimens.size220,
                crossAxisSpacing: Dimens.size2W,
                mainAxisExtent: Responsive.isDesktop(context)
                    ? Dimens.size390H
                    : Dimens.size355H,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerContainer(
                      shimmerHeight: Dimens.size250H,
                      shimmerWidth: Dimens.size167W,
                    ),
                    SizedBox(height: Dimens.size10H),
                    ShimmerContainer(
                      shimmerHeight: Dimens.size20H,
                      shimmerWidth: Dimens.size120W,
                    ),
                    SizedBox(height: Dimens.size8H),
                    ShimmerContainer(
                      shimmerHeight: Dimens.size15H,
                      shimmerWidth: width / Dimens.size3W,
                    ),
                    SizedBox(height: Dimens.size4H),
                    ShimmerContainer(
                      shimmerHeight: Dimens.size10H,
                      shimmerWidth: width / Dimens.size2W,
                    ),
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
