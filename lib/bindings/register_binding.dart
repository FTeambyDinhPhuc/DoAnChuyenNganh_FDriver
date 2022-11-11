import 'package:fdriver/controllers/place_search_controller.dart';
import 'package:fdriver/controllers/register_controller.dart';

import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<PlaceSearchController>(() => PlaceSearchController());
  }
}
