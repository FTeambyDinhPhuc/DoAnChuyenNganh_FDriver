import 'package:fdriver/methodshares/shared_preferences.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var idDriver = ''.obs;
  var passDriver = ''.obs;

  getIdDriver() async {
    idDriver.value = await BaseSharedPreferences.getString('id_taixe');
    passDriver.value = await BaseSharedPreferences.getString('mk_taixe');
  }

  logout() async {
    await BaseSharedPreferences.remove('id_taixe');
    await BaseSharedPreferences.remove('mk_taixe');
    Get.offAllNamed(RoutesClass.splash);
  }
}
