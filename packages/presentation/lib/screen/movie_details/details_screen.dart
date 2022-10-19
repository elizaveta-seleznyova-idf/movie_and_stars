import 'package:domain/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/generated_localization/l10n.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/movie_details/details_bloc.dart';
import 'package:presentation/screen/movie_details/details_data.dart';
import 'package:presentation/screen/movie_details/widgets/details_background_image.dart';
import 'package:presentation/screen/movie_details/widgets/details_body.dart';
import 'package:presentation/screen/movie_details/widgets/details_movie_image.dart';
import 'package:presentation/screen/movie_details/widgets/details_shimmer.dart';
import 'package:presentation/screen/movie_details/widgets/details_tab_bar.dart';

class DetailsScreenArguments extends BaseArguments {
  DetailsScreenArguments({
    required this.movieInfo,
    super.result,
  });

  final Movie movieInfo;
}

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  static const _routeName = '/MovieDetailsScreen';

  static BasePage page(DetailsScreenArguments arguments) => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const DetailsScreen(),
        showSlideAnim: true,
        arguments: arguments,
        isButtonNavBarActive: true,
      );

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends BlocScreenState<DetailsScreen, DetailsBloc> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocData<DetailsData?>>(
      stream: bloc.dataStream,
      builder: (context, snapshot) {
        final data = snapshot.data;
        final DetailsData? blocData = data?.data;
        final movie = blocData?.detailsAboutMovie;
        final details = blocData?.aboutMovie;
        if (data != null && blocData != null) {
          return data.isLoading
              ? const DetailsShimmer()
              : Scaffold(
                  body: Stack(
                    children: [
                      CustomScrollView(
                        controller: bloc.scrollController,
                        slivers: [
                          SliverAppBar(
                            elevation: Dimens.size0,
                            backgroundColor: Colors.transparent,
                            stretch: true,
                            pinned: true,
                            actions: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  final movieIdTmdb = movie?.ids?.tmdb ?? 0;
                                  bloc.shareMovieMessage(
                                    movieId: movieIdTmdb,
                                  );
                                },
                                child: const Icon(
                                  Icons.shortcut,
                                  size: Dimens.size36,
                                ),
                              ),
                              const SizedBox(width: Dimens.size18)
                            ],
                            expandedHeight: Dimens.size262,
                            flexibleSpace: FlexibleSpaceBar(
                              background: DetailsBackGroundImage(
                                movie: details,
                              ),
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                DetailsBody(
                                  blocData: blocData,
                                  bloc: bloc,
                                ),
                              ],
                            ),
                          ),
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: DetailsTabBar(
                              data: data,
                              movie: movie,
                              blocData: blocData,
                              bloc: bloc,
                            ),
                          ),
                        ],
                      ),
                      DetailsMovieImage(
                        image: details?.image,
                        controller: bloc.scrollController,
                      ),
                    ],
                  ),
                );
        } else {
          return Center(
            child: Text(SM.current.checkYourInternet),
          );
        }
      },
    );
  }
}
