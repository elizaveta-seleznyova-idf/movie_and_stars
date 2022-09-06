import 'package:flutter/material.dart';
import 'package:presentation/config/theme/app_colors.dart';
import 'package:presentation/navigation/base_arguments.dart';
import 'package:presentation/navigation/base_page.dart';

class HomeScreenArguments extends BaseArguments {}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static const _routeName = '/HomeScreen';

  static BasePage page(HomeScreenArguments arguments) => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const HomeScreen(),
        showSlideAnim: true,
        arguments: arguments,
      );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: AppColorsDark.primaryColorDark,
        elevation: 0,
        title: const Text(
          'Star Movie',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.search,
              size: 35.0,
            ),
          ),
        ],
      ),
      body: const HomeTabBar(),
      bottomNavigationBar: const NavigationBar(),
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border:
            Border(top: BorderSide(color: AppColorsDark.borderTabBar, width: 1)),
      ),
      child: BottomNavigationBar(
        selectedItemColor: AppColorsDark.selectedBottomNavItem,
        unselectedItemColor: AppColorsDark.unselectedBottomNavItem,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Page1',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Page2'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Page3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Page4',
          ),
        ],
      ),
    );
  }
}

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColorsDark.borderTabBar,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TabBar(
              indicator: BoxDecoration(
                color: AppColorsDark.redTabBar,
                borderRadius: BorderRadius.circular(16),
              ),
              tabs: <Widget>[
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.play_circle),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Now Showing',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const Tab(
                  child: Text(
                    'Coming soon',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
