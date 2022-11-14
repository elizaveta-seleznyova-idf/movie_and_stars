import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/utils/image_path.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.fill,
      width: Dimens.size167W,
      height: Dimens.size250H,
      errorBuilder: (context, exception, stackTrace) => SizedBox(
        width: Dimens.size167W,
        height: Dimens.size250H,
        child: SvgPicture.asset(
          ImagesPath.noImage,
          fit: BoxFit.fill,
          color: AppColorsDark.unselectedColor,
        ),
      ),
    );
  }
}
