import 'package:domain/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/responsive/responsive.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/enum/details_tab_state.dart';
import 'package:presentation/generated_localization/l10n.dart';
import 'package:presentation/screen/movie_details/details_bloc.dart';
import 'package:presentation/screen/movie_details/details_data.dart';
import 'package:presentation/screen/movie_details/widgets/movie_description_text.dart';
import 'package:presentation/screen/movie_details/widgets/movie_list_actors.dart';

class DetailsViewWidget extends StatefulWidget {
  const DetailsViewWidget({
    required this.movie,
    required this.blocData,
    required this.bloc,
    required this.data,
    required this.tabState,
    super.key,
  });

  final Movie? movie;
  final DetailsData blocData;
  final DetailsBloc bloc;
  final BlocData<DetailsData?> data;
  final DetailsTabState tabState;

  @override
  State<DetailsViewWidget> createState() => _DetailsViewWidgetState();
}

class _DetailsViewWidgetState extends State<DetailsViewWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final synopsis = widget.movie?.overview;
    const int trimLinesCount = 4;
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimens.size18,
        right: Dimens.size17,
      ),
      child: Responsive.isMobile(context)
          ? Column(
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
                    TextButton(
                      onPressed: widget.bloc.pushToViewAllCastCrew,
                      child: Text(
                        SM.current.viewAll,
                        style: AppTextStyles.sfProRegularSelected14px,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimens.size280,
                  child: MovieListActors(
                    cast: widget.blocData.detailsAboutPeople,
                    listLength: 4,
                    isScrollable: false,
                    additionalIndex: 0,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                SizedBox(height: Dimens.size32.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width / 3,
                      child: Column(
                        children: [
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
                        ],
                      ),
                    ),
                    SizedBox(width: Dimens.size10.w),
                    SizedBox(
                      width: width / 2.2,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                SM.current.castAndCrew,
                                textAlign: TextAlign.left,
                                style: AppTextStyles.sfProMedium18px,
                              ),
                              TextButton(
                                onPressed: widget.bloc.pushToViewAllCastCrew,
                                child: Text(
                                  SM.current.viewAll,
                                  style: AppTextStyles.sfProRegularSelected14px,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimens.size280.h,
                            child: MovieListActors(
                              cast: widget.blocData.detailsAboutPeople,
                              listLength: 4,
                              isScrollable: false,
                              additionalIndex: 0,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
