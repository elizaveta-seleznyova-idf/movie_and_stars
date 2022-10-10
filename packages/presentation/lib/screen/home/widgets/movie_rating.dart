import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/theme/app_colors.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({
    required this.rating,
    required this.starsSize,
    super.key,
  });

  final double rating;
  final double starsSize;
  static const int itemCountSize = 5;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      ignoreGestures: true,
      initialRating: rating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: itemCountSize,
      itemSize: starsSize,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star,
          color: AppColorsDark.starColor,
        ),
        half: const Icon(
          Icons.star_half,
          color: AppColorsDark.starColor,
        ),
        empty: const Icon(
          Icons.star_border,
          color: AppColorsDark.starColor,
        ),
      ),
      itemPadding: const EdgeInsets.only(right: Dimens.size1),
      onRatingUpdate: (rating) {},
    );
  }
}
