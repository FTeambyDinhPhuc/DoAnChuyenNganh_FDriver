import 'package:fdriver/methodshares/shared_preferences.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String idDriver = '';
  String passDriver = '';
  var disposeHome = true.obs;

  getIdDriver() async {
    idDriver = await BaseSharedPreferences.getString('id_taixe');
    passDriver = await BaseSharedPreferences.getString('mk_taixe');
    if (idDriver != '' && passDriver != '') {
      disposeHome.value = false;
    }
  }

  logout() {
    BaseSharedPreferences.remove('id_taixe');
    BaseSharedPreferences.remove('mk_taixe');
    Get.offAllNamed(RoutesClass.splash);
  }
}
