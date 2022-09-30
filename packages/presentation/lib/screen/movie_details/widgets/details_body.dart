import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/screen/home/widgets/movie_rating.dart';
import 'package:presentation/screen/movie_details/details_bloc.dart';
import 'package:presentation/screen/movie_details/details_data.dart';
import 'package:presentation/utils/extensions/extention_int.dart';
import 'package:presentation/utils/extensions/extention_list.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    required this.data,
    required this.blocData,
    required this.bloc,
    super.key,
  });

  final BlocData<DetailsData?> data;
  final DetailsData blocData;
  final DetailsBloc bloc;

  @override
  Widget build(BuildContext context) {
    final movieInformation = blocData.detailsAboutMovie;
    final title = movieInformation?.title ?? '';
    final time = movieInformation?.runtime.getTimeString();
    final timeAndCertification = '$time | ${movieInformation?.certification}';
    final genres = movieInformation?.genres?.capitalizeFirstOfEach();
    final double rating =
        double.parse((movieInformation!.rating! / 2).toStringAsFixed(1));

    return Column(
      children: [
        const SizedBox(
          height: Dimens.size150,
        ),
        Text(
          title,
          style: AppTextStyles.sfProSemiBold24px,
        ),
        const SizedBox(
          height: Dimens.size16,
        ),
        Text(
          timeAndCertification,
          style: AppTextStyles.sfProRegularUnselected16px,
        ),
        const SizedBox(
          height: Dimens.size9,
        ),
        Text(
          '$genres',
          style: AppTextStyles.sfProRegularUnselected16px,
        ),
        const SizedBox(
          height: Dimens.size29,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$rating / 5',
              style: AppTextStyles.sfProRegular30px,
            ),
            const SizedBox(
              width: Dimens.size8,
            ),
            MovieRating(
              rating: rating,
              starsSize: Dimens.size26,
            ),
          ],
        ),
      ],
    );
  }
}
