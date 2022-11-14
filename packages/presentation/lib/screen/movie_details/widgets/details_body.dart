import 'package:flutter/material.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/screen/home/widgets/movie_rating.dart';
import 'package:presentation/screen/movie_details/details_bloc.dart';
import 'package:presentation/screen/movie_details/details_data.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    required this.blocData,
    required this.bloc,
    super.key,
  });

  final DetailsData blocData;
  final DetailsBloc bloc;

  @override
  Widget build(BuildContext context) {
    final movieInformation = blocData.aboutMovie;
    const double maxRating = 5;
    if (movieInformation == null) {
      return const SizedBox();
    } else {
      return Column(
        children: [
          SizedBox(height: Dimens.size150H),
          Text(
            movieInformation.title,
            style: AppTextStyles.sfProSemiBold24px,
          ),
          SizedBox(height: Dimens.size16H),
          Text(
            movieInformation.runTime,
            style: AppTextStyles.sfProRegularUnselected16px,
          ),
          SizedBox(height: Dimens.size9H),
          Text(
            movieInformation.genres,
            style: AppTextStyles.sfProRegularUnselected16px,
          ),
          SizedBox(height: Dimens.size29H),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${movieInformation.rating} / $maxRating',
                style: AppTextStyles.sfProRegular30px,
              ),
              SizedBox(width: Dimens.size8W),
              MovieRating(
                rating: movieInformation.rating,
                starsSize: Dimens.size26R,
              ),
            ],
          ),
        ],
      );
    }
  }
}
