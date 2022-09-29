import 'package:domain/use_case/get_people_use_case.dart';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/screen/movie_details/details_data.dart';
import 'package:presentation/screen/movie_details/details_screen.dart';

abstract class DetailsBloc extends Bloc<DetailsScreenArguments, DetailsData> {
  factory DetailsBloc(GetPeopleUseCase getPeopleUseCase) => DetailsBlocImpl(
        getPeopleUseCase,
      );
}

class DetailsBlocImpl extends BlocImpl<DetailsScreenArguments, DetailsData>
    implements DetailsBloc {
  final GetPeopleUseCase _blocGetCast;

  DetailsBlocImpl(
    this._blocGetCast,
  );

  DetailsData _stateData = DetailsData.init();

  @override
  void initState(){
    super.initState();
  }

  _updateData({
    bool? isBottomNavigationActive,
    bool? isLoading,
  }) {
    handleData(
      isBottomNavigationActive: isBottomNavigationActive,
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
    final listPerson = await _blocGetCast(arguments.movieInfo.ids?.slug);
    _stateData = DetailsData(
      detailsAboutMovie: arguments.movieInfo,
      detailsAboutPeople: listPerson,
    );
    _updateData(
      isLoading: false,
    );
  }
}
