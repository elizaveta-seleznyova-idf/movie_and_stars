import 'package:flutter/material.dart';
import 'package:presentation/config/text_style/text_style.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    required this.movieTitleText,
    super.key,
  });

  final String movieTitleText;

  @override
  Widget build(BuildContext context) {
    return Text(
      movieTitleText,
      style: AppTextStyles.sfProMedium16px,
    );
  }
}
