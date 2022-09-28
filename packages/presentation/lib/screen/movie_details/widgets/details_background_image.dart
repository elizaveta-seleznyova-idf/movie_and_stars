import 'package:domain/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/utils/image_path.dart';

class DetailsBackGroundImage extends StatelessWidget {
  const DetailsBackGroundImage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.network(
            '${ImagesPath.imageUrl}${movie?.ids?.imdb}',
            fit: BoxFit.cover,
            errorBuilder: (context, exception, stackTrace) => SvgPicture.asset(
              ImagesPath.noImage,
              fit: BoxFit.cover,
              color: AppColorsDark.unselectedColor,
            ),
          ),
        ),
      ],
    );
  }
}
