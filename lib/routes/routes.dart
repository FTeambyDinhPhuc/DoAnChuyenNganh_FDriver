import 'package:fdriver/bindings/home_binding.dart';
import 'package:fdriver/bindings/login_binding.dart';
import 'package:fdriver/bindings/register_binding.dart';
import 'package:fdriver/bindings/run_binding.dart';
import 'package:fdriver/bindings/splash_binging.dart';
import 'package:fdriver/view/changepassword/change_password_screen.dart';
import 'package:fdriver/view/home/home_screen.dart';
import 'package:fdriver/view/login/login_screen.dart';
import 'package:fdriver/view/register/register_screen.dart';
import 'package:fdriver/view/registercar/register_car_screen.dart';
import 'package:fdriver/view/run/run_screen.dart';
import 'package:fdriver/view/selectlogin/select_login_screen.dart';
import 'package:fdriver/view/splash/splash_screen.dart';
import 'package:fdriver/view/takeorders/take_order_screen.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String splash = "/splash";
  static String selectLogin = "/selectlogin";
  static String login = "/login";
  static String register = "/register";
  static String registerCar = "/registercar";
  static String home = "/";
  static String changePassword = "/changepassword";
  static String run = "/run";
  static String takeOrder = "/takeorder";

  static List<GetPage> routes = [
    GetPage(
        name: splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: home,
        page: () => const MyHomePage(),
        binding: HomeBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: selectLogin,
        page: () => const SelectLogin(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: login,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: register,
        page: () => const RegisterScreen(),
        binding: RegisterBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: registerCar,
        page: () => const RegisterCarScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: changePassword,
        page: () => ChangePassword(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: run,
        page: () => const RunScreen(),
        binding: RunBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
        name: takeOrder,
        page: () => const TakeOrderScreen(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 300)),
  ];
}
