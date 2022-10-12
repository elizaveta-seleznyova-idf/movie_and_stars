import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/splash/splash_screen.dart';

class AppData {
  AppData({
    required this.pages,
    required this.isButtonNavBarActive,
    required this.currentPageIndex,
  });

  final List<BasePage> pages;
  bool isButtonNavBarActive;
  int currentPageIndex;

  factory AppData.init() {
    final pages = List<BasePage>.from([SplashScreen.page()]);
    return AppData(
      pages: pages,
      isButtonNavBarActive: true,
      currentPageIndex: 0,
    );
  }
}
