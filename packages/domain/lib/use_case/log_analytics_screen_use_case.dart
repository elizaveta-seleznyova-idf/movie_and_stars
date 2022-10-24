import 'package:domain/services/analytics_service.dart';
import 'package:domain/use_case/use_case.dart';
import 'package:domain/utils/analytics_constants.dart';

class LogAnalyticsScreenUseCase extends UseCaseParams<String, Future<void>> {
  LogAnalyticsScreenUseCase(this._analytics);

  final AnalyticsService _analytics;

  @override
  Future<void> call(String params) => _analytics.analyticsEvent(
        AnalyticsConstants.screenView,
        payload: {AnalyticsConstants.screenEventName: params},
      );
}
