import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/location_controller.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RunScreen extends StatefulWidget {
  const RunScreen({super.key});

  @override
  State<RunScreen> createState() => _RunScreenState();
}

class _RunScreenState extends State<RunScreen> {
  var _locationController = Get.find<LocationController>();
  var _orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Obx(() => Text(
                  '${_orderController.statusOrder.value}',
                  style: Theme.of(context).textTheme.headline3,
                )),
          )),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Expanded(
          child: Obx(
            () {
              if (_locationController.added.value) {
                _locationController.updateCameraMap();
              }
              return GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                    target: LatLng(_locationController.currentLatiTude.value,
                        _locationController.currentLongiTude.value),
                    zoom: 16),
                polylines: {
                  Polyline(
                      polylineId: PolylineId('route'),
                      points: _locationController.polylineCoordinates.value,
                      color: Theme.of(context).primaryColor,
                      width: 6)
                },
                markers: {
                  if (_orderController.statusOrder.value ==
                          statusToPickUpPoint ||
                      _orderController.statusOrder.value == statusStartTheTrip)
                    Marker(
                      markerId: MarkerId("destinationLocation"),
                      position: LatLng(
                          _locationController.destinationLatiTude.value,
                          _locationController.destinationLongtiTude.value),
                    ),
                },
                onMapCreated: (mapController) {
                  _locationController.googleController.complete(mapController);
                  _locationController.added.value = true;
                },
              );
            },
          ),
        ),
        Obx(() => Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: _orderController.statusOrder.value == statusStarting
                ? ButtonFullWidth(
                    text: 'Tới điểm đón',
                    color: Colors.orange,
                    press: () async {
                      _orderController.statusOrder.value = statusToPickUpPoint;
                      await _locationController
                          .setDestinationLocation(_orderController.pickUpPoint);
                      _locationController.getPolyPoints();
                    })
                : _orderController.statusOrder.value == statusToPickUpPoint
                    ? ButtonFullWidth(
                        text: 'Khởi hành',
                        color: Colors.blue.shade300,
                        press: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                titleSnackbarOrder,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              content: Text(
                                'Xác nhận khởi hành',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      _orderController.statusOrder.value =
                                          statusStartTheTrip;
                                      await _locationController
                                          .setDestinationLocation(
                                              _orderController.destination);
                                      _locationController.getPolyPoints();
                                      Get.back();
                                    },
                                    child: Text(
                                      'Xác nhận',
                                    )),
                              ],
                            ),
                          );
                        })
                    : ButtonFullWidth(
                        text: 'Hoàn thành',
                        press: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                titleSnackbarOrder,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              content: Text(
                                'Xác nhận hoàn thành',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      _orderController.statusOrder.value =
                                          statusCompleted;
                                      Get.toNamed(RoutesClass.home);
                                    },
                                    child: Text(
                                      'Xác nhận',
                                    )),
                              ],
                            ),
                          );
                        })))
      ]),
    );
  }
}
