import 'package:domain/model/people_and_images_model.dart';
import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_screen.dart';
import 'package:presentation/config/dimens/dimens.dart';
import 'package:presentation/config/responsive/responsive.dart';
import 'package:presentation/config/text_style/text_style.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/generated_localization/l10n.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/cast_list/cast_crew_bloc.dart';
import 'package:presentation/screen/cast_list/cast_crew_data.dart';
import 'package:presentation/screen/movie_details/widgets/movie_list_actors.dart';

class CastCrewScreenArguments extends BaseArguments {
  CastCrewScreenArguments({
    required this.detailsAboutPeople,
    super.result,
  });

  final List<PeopleAndImagesModel>? detailsAboutPeople;
}

class CastCrewScreen extends StatefulWidget {
  const CastCrewScreen({super.key});

  static const _routeName = '/CastListScreen';

  static BasePage page(CastCrewScreenArguments arguments) => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const CastCrewScreen(),
        showSlideAnim: true,
        arguments: arguments,
        isButtonNavBarActive: false,
      );

  @override
  State<CastCrewScreen> createState() => _CastCrewScreenState();
}

class _CastCrewScreenState
    extends BlocScreenState<CastCrewScreen, CastCrewBloc> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return StreamBuilder<BlocData<CastCrewData?>>(
        stream: bloc.dataStream,
        builder: (context, snapshot) {
          final BlocData<CastCrewData?>? data = snapshot.data;
          final CastCrewData? blocData = data?.data;
          final List<PeopleAndImagesModel>? details =
              blocData?.detailsAboutPeople;
          final int? castLength = details?.length;
          if (data != null && blocData != null) {
            if (data.isLoading && castLength == null) {
              return Center(child: Text(SM.current.checkYourInternet));
            } else {
              final halfCastLength = (details!.length) ~/ 2;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColorsDark.primaryColorDark,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(Dimens.size1),
                    child: Container(
                      color: AppColorsDark.borderTabBar,
                      height: Dimens.size1,
                    ),
                  ),
                  elevation: Dimens.size0,
                  title: Padding(
                    padding: const EdgeInsets.only(
                      left: Dimens.size12,
                    ),
                    child: Text(
                      SM.current.castAndCrew,
                      style: AppTextStyles.sfProSemiBold24px,
                    ),
                  ),
                ),
                body: Scrollbar(
                  child: Padding(
                      padding: const EdgeInsets.only(
                        top: Dimens.size10,
                        right: Dimens.size18,
                        left: Dimens.size17,
                      ),
                      child: Responsive.isMobile(context)
                          ? SingleChildScrollView(
                            child: MovieListActors(
                                cast: blocData.detailsAboutPeople,
                                listLength: castLength!,
                                isScrollable: true,
                                additionalIndex: 0,
                              ),
                          )
                          : ScrollConfiguration(
                              behavior: ScrollConfiguration.of(context)
                                  .copyWith(scrollbars: false),
                              child: SingleChildScrollView(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: width / 2.2,
                                      child: MovieListActors(
                                        cast: blocData.detailsAboutPeople,
                                        listLength: halfCastLength,
                                        isScrollable: false,
                                        additionalIndex: 0,
                                      ),
                                    ),
                                    const SizedBox(width: Dimens.size10),
                                    SizedBox(
                                      width: width / 2.2,
                                      child: MovieListActors(
                                        cast: blocData.detailsAboutPeople,
                                        listLength: halfCastLength,
                                        isScrollable: false,
                                        additionalIndex: halfCastLength,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                ),
              );
            }
          } else {
            return Center(child: Text(SM.current.checkYourInternet));
          }
        });
  }
}
