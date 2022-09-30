import 'package:domain/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/utils/image_path.dart';

class DetailsMovieImage extends StatefulWidget {
  const DetailsMovieImage({
    required this.image,
    required this.controller,
    super.key,
  });

  final Movie? image;
  final ScrollController controller;

  @override
  State<DetailsMovieImage> createState() => _DetailsMovieImageState();
}

class _DetailsMovieImageState extends State<DetailsMovieImage> {
  double currentPosition = 0;

  @override
  void initState() {
    super.initState();
    currentPosition = widget.controller.offset;
    widget.controller.addListener(() {
      setState(() {
        currentPosition = widget.controller.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimens.size180 - currentPosition,
      right: Dimens.size0,
      left: Dimens.size0,
      child: Center(
        child: Image.network(
          '${ImagesPath.imageUrl}${widget.image?.ids?.imdb}',
          fit: BoxFit.fill,
          width: Dimens.size167,
          height: Dimens.size250,
          errorBuilder: (
            context,
            exception,
            stackTrace,
          ) =>
              SvgPicture.asset(
            ImagesPath.noImage,
            width: Dimens.size167,
            height: Dimens.size250,
            fit: BoxFit.fill,
            color: AppColorsDark.unselectedColor,
          ),
        ),
      ),
    );
  }
}
