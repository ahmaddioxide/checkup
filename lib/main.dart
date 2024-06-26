import 'package:checkup/core/services/auth_service.dart';
import 'package:checkup/firebase_options.dart';
import 'package:checkup/src/routes/app_routes.dart';
import 'package:checkup/src/theme/theming.dart';
import 'package:checkup/utils/logger.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'pages/bottom_navigation_screen/bottom_navigation_screen.dart';

Future<void> intiServices() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).onError((error, stackTrace) {
    myLog.e('Firebase initialization failed',
        error: error, stackTrace: stackTrace,);
    return Future.error('Firebase initialization failed');
  }).then((value) {
    myLog.i('Firebase initialized');
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intiServices();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          getPages: AppRoutes.routes,
          // named routes for the app
          initialRoute: AuthService.currentUser != null ? '/' : '/login',
          // default route for the app
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'Checkup App',
          theme: themeData,
          home: const BottomNavigationScreen(),
        );
      },
    );
  }
}
