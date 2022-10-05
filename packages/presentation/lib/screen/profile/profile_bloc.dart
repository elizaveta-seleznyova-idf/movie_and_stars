import 'package:presentation/base/bloc.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/screen/profile/profile_data.dart';

abstract class ProfileBloc extends Bloc<BaseArguments, ProfileData> {
  factory ProfileBloc() => _ProfileBloc();
}

class _ProfileBloc extends BlocImpl<BaseArguments, ProfileData>
    implements ProfileBloc {
  _ProfileBloc();

  ProfileData _stateData = ProfileData.init();

  @override
  void initState() async {
    super.initState();
    _updateData(data: _stateData);
  }

  _updateData({
    ProfileData? data,
    bool? isLoading,
  }) {
    handleData(
      data: data,
      isLoading: isLoading,
    );
  }
}
