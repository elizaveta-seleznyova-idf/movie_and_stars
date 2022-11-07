import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/utils/image_path.dart';

class MovieContent extends StatelessWidget {
  const MovieContent({
    required this.movieGenre,
    required this.movieTime,
    required this.certification,
    super.key,
  });

  final String movieGenre;
  final String movieTime;
  final String certification;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          movieGenre,
          style: AppTextStyles.sfProMediumUnselected12px,
        ),
        SizedBox(width: Dimens.size4.w),
        SvgPicture.asset(
          ImagesPath.ellipseImage,
          height: Dimens.size4.h,
          width: Dimens.size4.w,
          color: AppColorsDark.unselectedColor,
        ),
        SizedBox(width: Dimens.size4.w),
        Text(
          '$movieTime | $certification',
          style: AppTextStyles.sfProMediumUnselected12px,
        ),
      ],
    );
  }
}
