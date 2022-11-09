import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/responsive/responsive.dart';
import 'package:presentation/enum/details_tab_state.dart';
import 'package:presentation/screen/movie_details/details_bloc.dart';
import 'package:presentation/screen/movie_details/details_data.dart';
import 'package:presentation/screen/movie_details/widgets/details_reviews_list.dart';
import 'package:presentation/screen/movie_details/widgets/details_reviews_shimmer.dart';

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
  final countRowOfComments = 2;

  @override
  Widget build(BuildContext context) {
    final comments = widget.blocData.movieComments;
    final int dividedLength = comments.length ~/ countRowOfComments;
    final int secondRowComments = comments.length - dividedLength;
    return SingleChildScrollView(
      child: widget.blocData.isContentLoading
          ? const DetailsReviewsShimmer()
          : Padding(
              padding: EdgeInsets.only(
                left: Dimens.size18.w,
                right: Dimens.size17.w,
              ),
              child: Responsive.isMobile(context)
                  ? DetailsReviewsList(
                      rowLength: comments.length,
                      comments: comments,
                      commentsListIndex: 0,
                    )
                  : Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DetailsReviewsList(
                              rowLength: dividedLength,
                              comments: comments,
                              commentsListIndex: 0,
                            ),
                            SizedBox(width: Dimens.size15.w),
                            DetailsReviewsList(
                              rowLength: secondRowComments,
                              comments: comments,
                              commentsListIndex: dividedLength,
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
    );
  }
}
