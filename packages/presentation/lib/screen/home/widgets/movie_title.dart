import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({Key? key, required this.movieTitleText}) : super(key: key);

  final String movieTitleText;

  @override
  Widget build(BuildContext context) {
    return Text(
      movieTitleText,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}
