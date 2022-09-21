import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/utils/image_path.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.fill,
      width: 167,
      height: 250,
      errorBuilder: (context, exception, stackTrace) => SvgPicture.asset(
        ImagesPath.noImage,
        height: 250,
        width: 167,
        fit: BoxFit.fill,
        color: AppColorsDark.unselectedColor,
      ),
    );
  }
}
