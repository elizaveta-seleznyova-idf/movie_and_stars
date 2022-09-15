import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/utils/image_path.dart';

class MovieContent extends StatelessWidget {
  const MovieContent({
    Key? key,
    required this.movieGenre,
    required this.movieTime,
    required this.certification,
  }) : super(key: key);

  final String movieGenre;
  final String movieTime;
  final String certification;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          movieGenre,
          style: const TextStyle(
            fontSize: 12,
            color: AppColorsDark.unselectedColor,
          ),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(
          ImagesPath.ellipseImage,
          height: 4,
          width: 4,
          color: AppColorsDark.unselectedColor,
        ),
        const SizedBox(width: 4),
        Text(
          '$movieTime | $certification',
          style: const TextStyle(
            fontSize: 12,
            color: AppColorsDark.unselectedColor,
          ),
        ),
      ],
    );
  }
}
