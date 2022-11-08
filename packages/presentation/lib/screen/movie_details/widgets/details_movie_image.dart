import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  final String? image;
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
      top: Dimens.size180.h - currentPosition,
      right: Dimens.size0,
      left: Dimens.size0,
      child: Center(
        child: Image.network(
          '${widget.image}',
          fit: BoxFit.fill,
          width: Dimens.size167,
          height: Dimens.size250.h,
          errorBuilder: (
            context,
            exception,
            stackTrace,
          ) =>
              SvgPicture.asset(
            ImagesPath.noImage,
            width: Dimens.size167,
            height: Dimens.size250.h,
            fit: BoxFit.fill,
            color: AppColorsDark.unselectedColor,
          ),
        ),
      ),
    );
  }
}
