import 'package:domain/services/analytics_service.dart';
import 'package:domain/use_case/use_case.dart';

class LogAnalyticsEventUseCase extends UseCaseParams<String, Future<void>> {
  LogAnalyticsEventUseCase(this._analytics);

  final AnalyticsService _analytics;

  @override
  Future<void> call(String params) => _analytics.analyticsEvent(params);
}