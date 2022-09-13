import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieRating extends StatelessWidget {
  MovieRating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: rating / 2,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 17,
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
