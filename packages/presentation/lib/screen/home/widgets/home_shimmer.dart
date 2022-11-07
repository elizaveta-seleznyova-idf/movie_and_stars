import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/responsive/responsive.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/screen/home/widgets/shimmer_container.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  static const int itemCountLength = 6;

  static const int flexSize = 2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    int crossAxisCountSize = Responsive.isDesktop(context) ? 4 : 2;
    return Shimmer.fromColors(
      baseColor: AppColorsDark.primaryColor,
      highlightColor: AppColorsDark.primaryGradientEnd,
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.size18),
              itemCount: itemCountLength,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: Dimens.size167.w / Dimens.size320.h,
                crossAxisCount: crossAxisCountSize,
                crossAxisSpacing: Dimens.size2.w,
                mainAxisExtent: Responsive.isDesktop(context)
                    ? Dimens.size380.h
                    : Dimens.size350.h,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerContainer(
                      shimmerHeight: Dimens.size250.h,
                      shimmerWidth: Dimens.size167.w,
                    ),
                    SizedBox(height: Dimens.size10.h),
                    ShimmerContainer(
                      shimmerHeight: Dimens.size20.h,
                      shimmerWidth: Dimens.size120.w,
                    ),
                    SizedBox(height: Dimens.size8.h),
                    ShimmerContainer(
                      shimmerHeight: Dimens.size15.h,
                      shimmerWidth: width / Dimens.size3.w,
                    ),
                    SizedBox(height: Dimens.size4.h),
                    ShimmerContainer(
                      shimmerHeight: Dimens.size10.h,
                      shimmerWidth: width / Dimens.size2.w,
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
