class BlocData<D> {
  BlocData({
    required this.isLoading,
    required this.data,
  });

  bool isLoading;
  D? data;

  factory BlocData.init() => BlocData<D>(
        isLoading: false,
        data: null,
      );

  BlocData<D> copy() => BlocData<D>(
        isLoading: isLoading,
        data: data,
      );

  void updateParams(
    bool? isBottomNavigationActive,
    bool? isLoading,
    D? data,
  ) {
    if (isLoading != null) this.isLoading = isLoading;
    if (data != null) this.data = data;
  }
}
