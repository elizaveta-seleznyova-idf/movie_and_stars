import 'package:domain/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/generated_localization/l10n.dart';
import 'package:presentation/screen/movie_details/details_bloc.dart';
import 'package:presentation/screen/movie_details/details_data.dart';
import 'package:presentation/screen/movie_details/widgets/movie_description_text.dart';
import 'package:presentation/screen/movie_details/widgets/movie_list_actors.dart';

class DetailsViewWidget extends StatelessWidget {
  const DetailsViewWidget({
    required this.movie,
    required this.blocData,
    required this.bloc,
    required this.data,
    super.key,
  });

  final Movie? movie;
  final DetailsData blocData;
  final DetailsBloc bloc;
  final BlocData<DetailsData?> data;

  @override
  Widget build(BuildContext context) {
    final synopsis = movie?.overview;
    const int trimLinesCount = 4;
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimens.size18,
        right: Dimens.size17,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: Dimens.size32),
          Text(
            SM.current.synopsis,
            style: AppTextStyles.sfProMedium18px,
          ),
          const SizedBox(height: Dimens.size16),
          SizedBox(
            height: Dimens.size115,
            child: MovieDescriptionText(
              text: '$synopsis',
              trimLines: trimLinesCount,
            ),
          ),
          const SizedBox(height: Dimens.size20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                SM.current.castAndCrew,
                textAlign: TextAlign.left,
                style: AppTextStyles.sfProMedium18px,
              ),
              Text(
                SM.current.viewAll,
                style: AppTextStyles.sfProRegularSelected14px,
              ),
            ],
          ),
          SizedBox(
            height: Dimens.size280,
            child: MovieListActors(
              blocData: blocData,
            ),
          ),
        ],
      ),
    );
  }
}
