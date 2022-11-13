import 'package:fdriver/methodshares/shared_preferences.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var idDriver = ''.obs;

  getIdDriver() async {
    idDriver.value = await BaseSharedPreferences.getString('id_taixe');
  }

  logout() async {
    await BaseSharedPreferences.remove('id_taixe');
    Get.offAllNamed(RoutesClass.splash);
  }
}
