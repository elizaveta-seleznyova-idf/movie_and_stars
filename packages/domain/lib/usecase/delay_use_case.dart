import 'package:domain/usecase/use_case.dart';

class DelayUseCase implements UseCase<Future<void>> {
  static DelayUseCase instance = DelayUseCase();
  final delaySeconds = 3;

  @override
  Future<void> call() async {
    await Future.delayed(
      Duration(seconds: delaySeconds),
    );
  }
}
