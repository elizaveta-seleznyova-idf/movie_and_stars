import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/enum/details_tab_state.dart';
import 'package:presentation/screen/home/widgets/movie_rating.dart';
import 'package:presentation/screen/movie_details/details_bloc.dart';
import 'package:presentation/screen/movie_details/details_data.dart';
import 'package:presentation/screen/movie_details/widgets/details_reviews_shimmer.dart';
import 'package:presentation/utils/image_path.dart';

class DetailsReviewsWidget extends StatefulWidget {
  const DetailsReviewsWidget({
    required this.blocData,
    required this.bloc,
    required this.data,
    required this.tabState,
    super.key,
  });

  final DetailsData blocData;
  final DetailsBloc bloc;
  final BlocData<DetailsData?> data;
  final DetailsTabState tabState;

  @override
  State<DetailsReviewsWidget> createState() => _DetailsReviewsWidgetState();
}

class _DetailsReviewsWidgetState extends State<DetailsReviewsWidget> {

  @override
  Widget build(BuildContext context) {
    final comments = widget.blocData.movieComments;
    return SingleChildScrollView(
      child: widget.blocData.isContentLoading
          ? const DetailsReviewsShimmer()
          : Column(
              children: List.generate(
                comments.length,
                (index) {
                  final currentComment = comments[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: Dimens.size18,
                      right: Dimens.size17,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: Dimens.size20),
                        Row(
                          children: [
                            SizedBox(
                              width: Dimens.size40,
                              height: Dimens.size40,
                              child: ClipOval(
                                child: Image.network(
                                  currentComment.userImage,
                                  fit: BoxFit.fill,
                                  errorBuilder:
                                      (context, exception, stackTrace) =>
                                          SvgPicture.asset(
                                    ImagesPath.noUserImage,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: Dimens.size12),
                            Container(
                              height: Dimens.size40,
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentComment.userName,
                                    textAlign: TextAlign.left,
                                    style: AppTextStyles.sfProMedium14px,
                                  ),
                                  Text(
                                    currentComment.dateComment,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppTextStyles.sfProMediumUnselected12px,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: Dimens.size25),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColorsDark.secondaryColor,
                          ),
                          padding: const EdgeInsets.only(
                            top: Dimens.size16,
                            left: Dimens.size16,
                            right: Dimens.size16,
                            bottom: Dimens.size19,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MovieRating(
                                rating: currentComment.rating,
                                starsSize: Dimens.size20,
                              ),
                              const SizedBox(height: Dimens.size9),
                              Text(currentComment.comment),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
