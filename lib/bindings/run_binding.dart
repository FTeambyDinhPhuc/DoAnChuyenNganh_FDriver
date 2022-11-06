import 'package:fdriver/controllers/location_controller.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:get/get.dart';

class RunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController());
    Get.lazyPut<OrderController>(() => OrderController());
  }
}
