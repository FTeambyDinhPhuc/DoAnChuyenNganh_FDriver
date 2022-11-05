import 'package:fdriver/view/home/home_screen.dart';
import 'package:fdriver/view/splash/splash_screen.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String splash = "/splash";
  static String home = "/";

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(
        name: home,
        page: () => const MyHomePage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
  ];
}
