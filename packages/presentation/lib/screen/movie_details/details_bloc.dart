import 'package:domain/use_case/get_comments_use_case.dart';
import 'package:domain/use_case/get_people_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:presentation/base/bloc.dart';
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

  void getCommentsInformation();

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

  @override
  ScrollController get scrollController => _scrollController;

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
    super.initArgs(arguments);
    _updateData(isLoading: true);
    _stateData = _stateData.copyWith(detailsScreenArguments: arguments);
    getCastInformation();
  }

  void getCastInformation() async {
    final stateDataArguments = _stateData.detailsScreenArguments;
    final movieId = _stateData.detailsScreenArguments?.movieInfo.ids?.slug;
    if (stateDataArguments != null && movieId != null) {
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

  @override
  void getCommentsInformation() async {
    final movieId = _stateData.detailsScreenArguments?.movieInfo.ids?.slug;
    final stateDataArguments = _stateData.detailsScreenArguments;
    if (stateDataArguments != null && movieId != null) {
      final listComments = await _getCommentsUseCase(movieId);
      final commentsInformation = _detailsMapper.commentsAboutMovie(
        listComments,
        _stateData,
      );
      _stateData = _stateData.copyWith(
        detailsAboutMovie: stateDataArguments.movieInfo,
        movieComments: commentsInformation.movieComments,
      );
      _updateData(data: _stateData);
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
