import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:waygo/route/app_route.dart';
import 'package:waygo/service/initialization_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  //透明状态栏
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.dark, statusBarColor: Colors.transparent)
  );

  await setupServiceLocator();

  runApp(const WayGoApp());

  requestPermission();
}

class WayGoApp extends StatelessWidget {
  const WayGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color themeColor = Color.fromRGBO(255, 81, 4, 1);

    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: '/login',
      getPages: AppRoute.routes,
      color: themeColor,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: themeColor,
            foregroundColor: Colors.white,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: themeColor,
        ),
      ),
      builder: FlutterSmartDialog.init(),
    );
  }
}


void requestPermission() async {
  bool hasLocationPermission = await requestLocationPermission();
}

// 申请定位权限
Future<bool> requestLocationPermission() async {
  await Permission.location.request();
  var status = await Permission.location.status;
  if (status == PermissionStatus.granted) {
    return true;
  } else {
    status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }
}
