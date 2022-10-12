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
      width: Dimens.size167,
      height: Dimens.size250,
      errorBuilder: (context, exception, stackTrace) => SvgPicture.asset(
        ImagesPath.noImage,
        width: Dimens.size167,
        height: Dimens.size250,
        fit: BoxFit.fill,
        color: AppColorsDark.unselectedColor,
      ),
    );
  }
}
