import 'package:presentation/base/base_state.dart';
import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/splash/splash_screen.dart';

class AppData extends BaseState {
  final List<BasePage> pages;

  AppData(
    this.pages,
  );

  factory AppData.init() {
    final pages = List<BasePage>.from([SplashScreen.page()]);
    return AppData(pages);
  }
}
