import 'package:domain/usecase/use_case.dart';

class SplashUseCase implements UseCase<Future<void>> {
  final _delaySeconds = 3;

  @override
  Future<void> call() async {
    await Future.delayed(
      Duration(seconds: _delaySeconds),
    );
  }
}
