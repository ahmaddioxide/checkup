import 'package:checkup/core/data/models/nav_model.dart';
import 'package:checkup/pages/appointments_screen/appointments_screen.dart';
import 'package:checkup/pages/home_screen/home_screen.dart';
import 'package:checkup/pages/notifications_screen/notifications_screen.dart';
import 'package:checkup/pages/user_profile/user_profile_screen.dart';
import 'package:checkup/pages/widgets/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final calenderNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavModel> items = [];

  @override
  void initState() {
    super.initState();
    items = [
      NavModel(
        page: const HomeScreen(),
        navKey: homeNavKey,
      ),
      NavModel(
        page: const AppointmentsScreen(),
        navKey: calenderNavKey,
      ),
      NavModel(
        page: const NotificationsScreen(),
        navKey: notificationNavKey,
      ),
      NavModel(
        page: const UserProfileScreen(),
        navKey: profileNavKey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: selectedTab,
          children: items
              .map(
                (page) => Navigator(
                  key: page.navKey,
                  onGenerateInitialRoutes: (navigator, initialRoute) {
                    return [
                      MaterialPageRoute(builder: (context) => page.page),
                    ];
                  },
                ),
              )
              .toList(),
        ),
        bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              items[index]
                  .navKey
                  .currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          },
        ),
      ),
    );
  }
}
