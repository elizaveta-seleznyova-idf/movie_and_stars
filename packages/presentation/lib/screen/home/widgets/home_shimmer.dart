import 'package:flutter/material.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/screen/home/widgets/shimmer_container.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Shimmer.fromColors(
      baseColor: AppColorsDark.primaryColor,
      highlightColor: AppColorsDark.primaryGradientEnd,
      child: Column(
        children: [
          Container(
            height: 35,
            margin: const EdgeInsets.only(
              top: 10,
              right: 18,
              left: 18,
              bottom: 24,
            ),
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: AppColorsDark.borderTabBar,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 167 / 330,
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerContainer(
                      shimmerHeight: 167,
                      shimmerWidth: 250,
                    ),
                    const SizedBox(height: 16),
                    ShimmerContainer(
                      shimmerHeight: 20,
                      shimmerWidth: 120,
                    ),
                    const SizedBox(height: 7),
                    ShimmerContainer(
                      shimmerHeight: 15,
                      shimmerWidth: width / 3,
                    ),
                    const SizedBox(height: 7),
                    ShimmerContainer(
                      shimmerHeight: 10,
                      shimmerWidth: width / 2.5,
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
