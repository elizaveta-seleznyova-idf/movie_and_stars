import 'package:domain/use_case/get_people_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/screen/movie_details/details_data.dart';
import 'package:presentation/screen/movie_details/details_screen.dart';
import 'package:presentation/screen/movie_details/mapper/details_mapper.dart';

abstract class DetailsBloc extends Bloc<DetailsScreenArguments, DetailsData> {
  factory DetailsBloc(
    GetPeopleUseCase getPeopleUseCase,
    MapperDetails detailsMapper,
  ) =>
      DetailsBlocImpl(
        getPeopleUseCase,
        detailsMapper,
      );

  ScrollController get scrollController;
}

class DetailsBlocImpl extends BlocImpl<DetailsScreenArguments, DetailsData>
    implements DetailsBloc {
  DetailsBlocImpl(
    this._blocGetCast,
    this._detailsMapper,
  );

  final GetPeopleUseCase _blocGetCast;
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
  void initArgs(DetailsScreenArguments arguments) async {
    super.initArgs(arguments);
    _updateData(
      isLoading: true,
    );
    final movieId = arguments.movieInfo.ids?.slug;
    if (movieId != null) {
      final listPerson = await _blocGetCast(movieId);
      final movieInformation = _detailsMapper.detailsAboutMovies(
        arguments.movieInfo,
        _stateData,
      );

      _stateData = _stateData.copyWith(
        detailsAboutMovie: arguments.movieInfo,
        detailsAboutPeople: listPerson,
        aboutMovie: movieInformation,
      );
      _updateData(
        isLoading: false,
        data: _stateData,
      );
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
