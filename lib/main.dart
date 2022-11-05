import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Đặt xe đường dài',
      theme: FgoTheme.lightTheme,
      initialRoute: RoutesClass.splash,
      getPages: RoutesClass.routes,
    );
  }
}
