import 'package:domain/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/config/dimens/dimens.dart';
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
  final Movie movieInfo;

  DetailsScreenArguments({
    required this.movieInfo,
    Function(dynamic value)? result,
  }) : super(result: result);
}

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

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
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocData<DetailsData?>>(
      stream: bloc.dataStream,
      builder: (context, snapshot) {
        final data = snapshot.data;
        final DetailsData? blocData = data?.data;
        final movie = blocData?.detailsAboutMovie;
        if (data != null && blocData != null) {
          return data.isLoading
              ? const DetailsShimmer()
              : Scaffold(
                  body: Stack(
                    children: [
                      CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          SliverAppBar(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            stretch: true,
                            pinned: true,
                            actions: <Widget>[
                              GestureDetector(
                                onTap: () {},
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
                                movie: movie,
                              ),
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                DetailsBody(
                                  data: data,
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
                        image: movie,
                        controller: scrollController,
                      ),
                    ],
                  ),
                );
        } else {
          return const Center(
            child: Text('Check your network connection!'),
          );
        }
      },
    );
  }
}
