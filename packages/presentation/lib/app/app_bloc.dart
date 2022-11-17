import 'package:collection/collection.dart';
import 'package:domain/use_case/log_analytics_event_use_case.dart';
import 'package:domain/use_case/log_analytics_screen_use_case.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/app/app_data.dart';
import 'package:presentation/base/bloc.dart';
import 'package:presentation/enum/bottom_navigation_page_type.dart';
import 'package:presentation/navigation/base_page.dart';
import 'package:presentation/screen/home/home_screen.dart';
import 'package:presentation/screen/login/login_screen.dart';
import 'package:presentation/screen/payment/payment_screen.dart';
import 'package:presentation/utils/analytics_constants.dart';

abstract class AppBloc extends Bloc {
  factory AppBloc(
    LogAnalyticsEventUseCase logAnalyticsEventUseCase,
    LogAnalyticsScreenUseCase logAnalyticsScreenUseCase,
  ) =>
      _AppBloc(
        logAnalyticsEventUseCase,
        logAnalyticsScreenUseCase,
      );

  void handleRemoveRouteSettings(RouteSettings value);

  void onItemTapped(int index);
}

class _AppBloc extends BlocImpl implements AppBloc {
  _AppBloc(
    this._logAnalyticsEvent,
    this._logAnalyticsScreen,
  );

  final LogAnalyticsEventUseCase _logAnalyticsEvent;
  final LogAnalyticsScreenUseCase _logAnalyticsScreen;
  final _appData = AppData.init();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _initNavHandler();
    _updateData();
  }

  @override
  void handleRemoveRouteSettings(RouteSettings value) {
    _appData.pages.remove(value);
    _updateData();
  }

  void _initNavHandler() {
    appNavigator.init(
      push: _push,
      popOldAndPush: _popOldAndPush,
      popAllAndPush: _popAllAndPush,
      popAndPush: _popAndPush,
      pushPages: _pushPages,
      popAllAndPushPages: _popAllAndPushPages,
      pop: _pop,
      maybePop: _maybePop,
      popUntil: _popUntil,
      currentPage: _currentPage,
    );
  }

  void _push(BasePage page) {
    _appData.pages.add(page);
    _updateData();
  }

  void _popAllAndPush(BasePage page) {
    _appData.pages.clear();
    _push(page);
  }

  void _popOldAndPush(BasePage page) {
    final oldIndex = _appData.pages.indexWhere(
      (element) => element.name == page.name,
    );
    if (oldIndex != -1) {
      _appData.pages.removeAt(oldIndex);
    }
    _push(page);
  }

  void _popAndPush(BasePage page) {
    _appData.pages.removeLast();
    _push(page);
  }

  void _pushPages(List<BasePage> pages) {
    pages.forEach(_appData.pages.add);
    _updateData();
  }

  void _popAllAndPushPages(List<BasePage> pages) {
    _appData.pages.clear();
    pages.forEach(_appData.pages.add);
    _updateData();
  }

  void _pop() {
    _appData.pages.removeLast();
    _updateData();
  }

  void _maybePop() {
    if (_appData.pages.length > 1) {
      _pop();
    }
  }

  void _popUntil(BasePage page) {
    final start = _appData.pages.indexWhere((e) => e.name == page.name) + 1;
    final end = _appData.pages.length;
    _appData.pages.removeRange(start, end);
    _updateData();
  }

  BasePage? _currentPage() => _appData.pages.lastOrNull;

  void _updateData() {
    _appData.isButtonNavBarActive =
        _currentPage()?.isButtonNavBarActive ?? true;
    _logAnalyticsScreen(_currentPage()?.name ?? '');
    super.handleData(data: _appData);
  }

  @override
  void onItemTapped(int index) {
    selectedIndex = index;
    _appData.currentPageIndex = selectedIndex;
    _updateData();
    final indexValue = BottomNavigationPageType.values[index];

    switch (indexValue) {
      case BottomNavigationPageType.home:
        _logAnalyticsEvent(AnalyticsEventConstants.eventHomeNavBar);
        _popAllAndPush(HomeScreen.page(HomeScreenArguments()));
        break;
      case BottomNavigationPageType.ticket:
        _logAnalyticsEvent(AnalyticsEventConstants.eventTicketsNavBar);
        _popAllAndPush(PaymentScreen.page(PaymentScreenArguments()));
        break;
      case BottomNavigationPageType.profile:
        _logAnalyticsEvent(AnalyticsEventConstants.eventProfileNavBar);
        _popAllAndPush(LoginScreen.page(LoginScreenArguments()));
        break;
    }
  }
}
