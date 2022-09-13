import 'package:flutter/material.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star_border,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star_border,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star_border,
          color: Colors.yellow,
          size: 20,
        ),
        Icon(
          Icons.star_border,
          color: Colors.yellow,
          size: 20,
        ),
      ],
    );
  }
}
