import 'package:domain/services/analytics_service.dart';
import 'package:domain/use_case/use_case.dart';

class AnalyticsUseCase extends UseCaseParams<String, Future<void>> {
  final AnalyticsService analytics;

  AnalyticsUseCase(this.analytics);

  @override
  Future<void> call(String params) => analytics.analyticsClick(params);
}