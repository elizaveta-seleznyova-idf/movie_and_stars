import 'dart:async';

import 'package:domain/use_case/log_analytics_event_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/navigation/app_navigation.dart';
import 'package:presentation/navigation/base_arguments.dart';

abstract class Bloc<T extends BaseArguments, D> {
  Stream<BlocData<D?>> get dataStream;

  void initState();

  void initArgs(T args);

  void dispose();
}

abstract class BlocImpl<T extends BaseArguments, D> implements Bloc<T, D> {
  final _data = StreamController<BlocData<D?>>();
  final BlocData<D> _blocData = BlocData.init();

  @protected
  final appNavigator = GetIt.I.get<AppNavigator>();
  @protected
  final logAnalyticsEventUseCase = GetIt.I.get<LogAnalyticsEventUseCase>();

  @override
  Stream<BlocData<D?>> get dataStream => _data.stream;

  @protected
  void handleData({
    bool? isBottomNavigationActive,
    bool? isLoading,
    D? data,
  }) {
    _blocData.updateParams(isBottomNavigationActive, isLoading, data);
    _data.add(_blocData.copy());
  }

  @override
  void initState() {}

  @override
  void initArgs(T arguments) {}

  @override
  void dispose() {
    _data.close();
  }
}
