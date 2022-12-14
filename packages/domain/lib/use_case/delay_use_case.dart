import 'package:domain/use_case/use_case.dart';

class DelayUseCase implements UseCase<Future<void>> {
  final _delaySeconds = 3;

  @override
  Future<void> call() async {
    await Future.delayed(
      Duration(seconds: _delaySeconds),
    );
  }
}
