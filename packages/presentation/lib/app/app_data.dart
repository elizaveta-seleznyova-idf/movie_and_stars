import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/splash/splash_screen.dart';

class AppData {
  final List<BasePage> pages;
  bool isButtonNavBarActive;

  AppData({
    required this.pages,
    required this.isButtonNavBarActive,
  });

  factory AppData.init() {
    final pages = List<BasePage>.from([SplashScreen.page()]);
    return AppData(pages: pages, isButtonNavBarActive: true);
  }
}
