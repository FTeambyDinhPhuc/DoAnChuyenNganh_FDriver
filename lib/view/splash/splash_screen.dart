import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/splash_controller.dart';
import 'package:fdriver/methodshares/shared_preferences.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _splashController = Get.find<SplashController>();

  @override
  void initState() {
    super.initState();
    _splashController.getGoogleMapAPIKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.teal,
                Colors.indigo,
              ]),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/image_splash.png",
                    height: 300.0,
                    width: 300.0,
                  ),
                  Text("Wellcome to FDriver\n Be a great driver",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.white)),
                ],
              ),
              CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.blue.shade200))
            ]),
      ),
    );
  }
}
