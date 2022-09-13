import 'package:flutter/material.dart';
import 'package:presentation/config/theme/app_colors.dart';
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
                    Container(
                      width: 167,
                      height: 250,
                      decoration: const BoxDecoration(
                        color: AppColorsDark.borderTabBar,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 20,
                      width: 120,
                      decoration: const BoxDecoration(
                        color: AppColorsDark.borderTabBar,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Container(
                      height: 15,
                      width: width / 3,
                      decoration: const BoxDecoration(
                        color: AppColorsDark.borderTabBar,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Container(
                      height: 10,
                      width: width / 2.5,
                      decoration: const BoxDecoration(
                        color: AppColorsDark.borderTabBar,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
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
