import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/config/dimens/dimens.dart';
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
  @override
  Widget build(BuildContext context) {
    final comments = widget.blocData.movieComments;
    return CustomScrollView(physics: AlwaysScrollableScrollPhysics(), slivers: [
      SliverFillRemaining(
        fillOverscroll: true,
        child: widget.blocData.isContentLoading
            ? const DetailsReviewsShimmer()
            : Padding(
                padding: EdgeInsets.only(
                  left: Dimens.size18W,
                  right: Dimens.size17W,
                ),
                child: DetailsReviewsList(
                  listLength: comments.length,
                  comments: comments,
                ),
              ),
      ),
    ]);
  }
}
