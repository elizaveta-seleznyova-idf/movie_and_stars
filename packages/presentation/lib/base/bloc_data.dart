import 'package:presentation/base/base_state.dart';

class BlocData {
  bool isLoading;
  BaseState? data;

  BlocData(
    this.isLoading,
    this.data,
  );

  factory BlocData.init() => BlocData(
        false,
        null,
      );

  BlocData copy() => BlocData(
        isLoading,
        data,
      );

  void updateParams(
    bool? isLoading,
    BaseState? data,
  ) {
    if (isLoading != null) this.isLoading = isLoading;
    if (data != null) this.data = data;
  }
}
