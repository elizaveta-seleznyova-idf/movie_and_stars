import 'package:domain/use_case/get_comments_use_case.dart';
import 'package:domain/use_case/get_people_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/enum/details_tab_state.dart';
import 'package:presentation/generated_localization/l10n.dart';
import 'package:presentation/screen/movie_details/details_data.dart';
import 'package:presentation/screen/movie_details/details_screen.dart';
import 'package:presentation/screen/movie_details/mapper/details_mapper.dart';
import 'package:share_plugin/share_plugin.dart';

abstract class DetailsBloc extends Bloc<DetailsScreenArguments, DetailsData> {
  factory DetailsBloc(
    GetPeopleUseCase getPeopleUseCase,
    GetCommentsUseCase getCommentsUseCase,
    MapperDetails detailsMapper,
  ) =>
      DetailsBlocImpl(
        getPeopleUseCase,
        getCommentsUseCase,
        detailsMapper,
      );

  ScrollController get scrollController;

  GlobalKey get detailsScreenFormKey;

  void onItemTapped(int index);

  void shareMovieMessage({required int movieId});
}

class DetailsBlocImpl extends BlocImpl<DetailsScreenArguments, DetailsData>
    implements DetailsBloc {
  DetailsBlocImpl(
    this._getCastUseCase,
    this._getCommentsUseCase,
    this._detailsMapper,
  );

  final GetPeopleUseCase _getCastUseCase;
  final GetCommentsUseCase _getCommentsUseCase;
  final MapperDetails _detailsMapper;
  DetailsData _stateData = DetailsData.init();
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;
  final GlobalKey<FormState> _detailsScreenFormKey = GlobalKey<FormState>();

  @override
  ScrollController get scrollController => _scrollController;

  @override
  GlobalKey get detailsScreenFormKey => _detailsScreenFormKey;

  void _updateData({
    bool? isLoading,
    DetailsData? data,
  }) {
    handleData(
      data: _stateData,
      isLoading: isLoading,
    );
  }

  @override
  void initArgs(DetailsScreenArguments arguments) {
    _stateData = _stateData.copyWith(detailsScreenArguments: arguments);
    _getCastInformation();
    _updateData(data: _stateData);
  }

  @override
  void onItemTapped(int index) {
    _selectedIndex = index;
    _stateData.currentTabIndex = _selectedIndex;
    _updateData(
      isLoading: false,
      data: _stateData,
    );
    final indexValue = DetailsTabState.values[index];

    switch (indexValue) {
      case DetailsTabState.reviews:
        _getCommentsInformation();
        break;
    }
  }

  @override
  void tabBarRequest(DetailsTabState tabState) {
    if (tabState == DetailsTabState.details) {
      _stateData = _stateData.copyWith(tabState: tabState);
    } else if (tabState == DetailsTabState.reviews) {
      _stateData = _stateData.copyWith(tabState: tabState);
      _getCommentsInformation();
    }
  }

  void _getCastInformation() async {
    final stateDataArguments = _stateData.detailsScreenArguments;
    final movieId = _stateData.detailsScreenArguments?.movieInfo.ids?.slug;
    if (stateDataArguments != null && movieId != null) {
      _updateData(isLoading: true);
      final listPerson = await _getCastUseCase(movieId);

      final movieInformation = _detailsMapper.detailsAboutMovies(
        stateDataArguments.movieInfo,
        _stateData,
      );
      _stateData = _stateData.copyWith(
        detailsAboutMovie: stateDataArguments.movieInfo,
        detailsAboutPeople: listPerson,
        aboutMovie: movieInformation,
      );
    }
    _updateData(
      isLoading: false,
      data: _stateData,
    );
  }

  void _getCommentsInformation() async {
    final movieId = _stateData.detailsScreenArguments?.movieInfo.ids?.slug;
    final stateDataArguments = _stateData.detailsScreenArguments;
    if (stateDataArguments != null && movieId != null) {
      _stateData = _stateData.copyWith(isContentLoading: true);
      _updateData(data: _stateData);
      final listComments = await _getCommentsUseCase(movieId);
      final commentsInformation = _detailsMapper.commentsAboutMovie(
        listComments,
        _stateData,
      );
      _stateData = _stateData.copyWith(
        detailsAboutMovie: stateDataArguments.movieInfo,
        movieComments: commentsInformation.movieComments,
      );
      _stateData = _stateData.copyWith(isContentLoading: false);
      _updateData(
        data: _stateData,
      );
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void shareMovieMessage({required int movieId}) {
    final messageBloc = SM.current.share(movieId);
    const String name = "Movie Sharing";
    SharePlugin.shareMethod(
      messageBloc,
      name,
    );
  }
}
