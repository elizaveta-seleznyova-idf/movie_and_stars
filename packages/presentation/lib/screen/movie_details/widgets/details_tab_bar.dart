import 'package:domain/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/generated_localization/l10n.dart';
import 'package:presentation/screen/movie_details/details_bloc.dart';
import 'package:presentation/screen/movie_details/details_data.dart';
import 'package:presentation/screen/movie_details/widgets/details_view_widget.dart';

class DetailsTabBar extends StatefulWidget {
  const DetailsTabBar({
    required this.data,
    required this.movie,
    required this.blocData,
    required this.bloc,
    super.key,
  });

  final BlocData<DetailsData?> data;
  final Movie? movie;
  final DetailsData blocData;
  final DetailsBloc bloc;

  @override
  State<DetailsTabBar> createState() => _DetailsTabBarState();
}

class _DetailsTabBarState extends State<DetailsTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int _currentIndex = 0;
  static const int _tabControllerLength = 3;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: _tabControllerLength, vsync: this);

    tabController.addListener(() {
      setState(() {
        _currentIndex = tabController.index;
      });
    });
  }

  Widget buildContent() {
    switch (_currentIndex) {
      case 0:
        return DetailsViewWidget(
          data: widget.data,
          movie: widget.movie,
          bloc: widget.bloc,
          blocData: widget.blocData,
        );
      case 1:
        return Container(
          height: Dimens.size250,
          color: AppColorsDark.selectedItem,
          child: Column(
            children: <Widget>[
              Center(
                child: Text(SM.current.reviews),
              )
            ],
          ),
        );
      case 2:
        return SizedBox(
          child: Column(
            children: <Widget>[
              Center(
                child: Text(SM.current.showtime),
              )
            ],
          ),
        );
    }
    return Center(child: Text(SM.current.error));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimens.size36,
          margin: const EdgeInsets.only(
            top: Dimens.size40,
            right: Dimens.size18,
            left: Dimens.size17,
            bottom: Dimens.size32,
          ),
          padding: const EdgeInsets.all(Dimens.size3),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColorsDark.borderTabBar,
              width: Dimens.size1,
            ),
            borderRadius: BorderRadius.circular(Dimens.size20),
          ),
          child: TabBar(
            controller: tabController,
            splashBorderRadius: BorderRadius.circular(Dimens.size16),
            indicator: BoxDecoration(
              color: AppColorsDark.primaryColor,
              borderRadius: BorderRadius.circular(Dimens.size16),
            ),
            tabs: <Widget>[
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      SM.current.details,
                      style: AppTextStyles.sfProMedium14px,
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      SM.current.reviews,
                      style: AppTextStyles.sfProMedium14px,
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      SM.current.showtime,
                      style: AppTextStyles.sfProMedium14px,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        buildContent(),
      ],
    );
  }
}
