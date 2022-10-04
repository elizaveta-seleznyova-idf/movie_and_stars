import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({
    Key? key,
    required this.rating,
    required this.starsSize,
  }) : super(key: key);

  final double rating;
  final double starsSize;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      ignoreGestures: true,
      initialRating: rating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: starsSize,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        half: const Icon(
          Icons.star_half,
          color: Colors.yellow,
        ),
        empty: const Icon(
          Icons.star_border,
          color: Colors.yellow,
        ),
      ),
      itemPadding: const EdgeInsets.only(right: 1.0),
      onRatingUpdate: (rating) {},
    );
  }
}
