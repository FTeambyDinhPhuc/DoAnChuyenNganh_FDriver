import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/home_controller.dart';
import 'package:fdriver/controllers/location_controller.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/models/order_model.dart';
import 'package:fdriver/routes/routes.dart';

import 'package:fdriver/widgets/my_button_small.dart';
import 'package:fdriver/widgets/ticket/ticket.dart';
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
  var _homeController = Get.find<HomeController>();

  OrderModel order = Get.arguments;

  @override
  void initState() {
    _orderController.getDataForRunScreen(order, _locationController);
    _locationController.updateCurrentLocation(order.idTaixe.toString());
    _locationController.getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    _locationController.stop = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Get.offAndToNamed(RoutesClass.nowHome);
              }),
          actions: [
            Obx(
              () => _orderController.statusOrder.value == statusBooked
                  ? ButtonTextIcon(
                      text: 'Tới điểm đón',
                      color: orangeColor,
                      press: () async {
                        _orderController.setStatus(
                            order.idChuyenxe.toString(), statusToPickUpPoint);
                        await _locationController.setDestinationLocation(
                            _orderController.pickUpPoint);
                        _locationController.getPolyPoints();
                      })
                  : _orderController.statusOrder.value == statusToPickUpPoint
                      ? ButtonTextIcon(
                          text: 'Khởi hành',
                          color: blueColor,
                          press: () async {
                            _orderController.setStatus(
                                order.idChuyenxe.toString(),
                                statusStartTheTrip);

                            await _locationController.setDestinationLocation(
                                _orderController.destination);
                            _locationController.getPolyPoints();
                          })
                      : ButtonTextIcon(
                          text: 'Hoàn thành',
                          color: Theme.of(context).primaryColor,
                          press: () {
                            _orderController.setStatus(
                                order.idChuyenxe.toString(), statusCompleted);
                            Get.offAndToNamed(RoutesClass.nowHome);
                          }),
            ),
          ],
          title: Obx(() => Text(
                '${_orderController.statusOrder.value}',
                style: Theme.of(context).textTheme.headline3,
              ))),
      body: Column(children: [
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
        Ticket(
          order: order,
          idTaiXe: _homeController.idDriver,
        ),
      ]),
    );
  }
}
