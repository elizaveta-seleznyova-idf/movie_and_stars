import 'package:flutter/material.dart';
import 'package:presentation/config/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.primaryColorDark,
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
      // This trailing comma makes auto-formatting nicer for build methods.
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
            Border(top: BorderSide(color: AppColors.borderTabBar, width: 1)),
      ),
      child: BottomNavigationBar(
        selectedItemColor: AppColors.selectedBottomNavItem,
        unselectedItemColor: AppColors.unselectedBottomNavItem,
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
                color: AppColors.borderTabBar,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TabBar(
              indicator: BoxDecoration(
                color: AppColors.redTabBar,
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
