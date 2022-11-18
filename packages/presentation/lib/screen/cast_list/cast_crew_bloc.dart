import 'package:presentation/base/bloc.dart';
import 'package:presentation/screen/cast_list/cast_crew_data.dart';
import 'package:presentation/screen/cast_list/cast_crew_screen.dart';

abstract class CastCrewBloc
    extends Bloc<CastCrewScreenArguments, CastCrewData> {
  factory CastCrewBloc() => CastCrewBlocImpl();
}

class CastCrewBlocImpl extends BlocImpl<CastCrewScreenArguments, CastCrewData>
    implements CastCrewBloc {
  CastCrewBlocImpl();

  CastCrewData _stateData = CastCrewData.init();

  void _updateData({
    bool? isLoading,
    CastCrewData? data,
  }) {
    handleData(
      data: _stateData,
      isLoading: isLoading,
    );
  }

  @override
  void initArgs(CastCrewScreenArguments arguments) {
    final details = arguments.detailsAboutPeople;
    _stateData = _stateData.copyWith(detailsAboutPeople: details);
    _updateData(data: _stateData);
  }
}
