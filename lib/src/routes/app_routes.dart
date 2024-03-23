//get named routes with GetPage and bind controllers

import 'package:checkup/pages/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:checkup/pages/edit_profile/edit_profile_controller.dart';
import 'package:checkup/pages/edit_profile/edit_profile_screen.dart';
import 'package:checkup/pages/login/login_controller.dart';
import 'package:checkup/pages/login/login_screen.dart';
import 'package:checkup/pages/signup/signup_controller.dart';
import 'package:checkup/pages/signup/signup_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(name: '/', page: () => const BottomNavigationScreen()),
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
      }),
    ),
    GetPage(
      name: '/signup',
      page: () => const SignupScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SignupController());
      }),
    ),
    GetPage(
      name: '/edit_profile',
      page: () => const EditProfileScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => EditProfileController());
      }),
    ),
  ];
}
