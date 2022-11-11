import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/place_search_controller.dart';
import 'package:fdriver/models/place_search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlacesListBox extends StatelessWidget {
  PlacesListBox(
      {Key? key,
      required this.searchResults,
      required this.placeSearchcontroller,
      required this.textController,
      required this.idLocation})
      : super(key: key);

  final PlaceSearchController placeSearchcontroller;
  final TextEditingController textController;
  var searchResults = <PlaceSearch>[].obs;
  RxString idLocation;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          child: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  searchResults[index].description,
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: () async {
                  idLocation.value =
                      await placeSearchcontroller.setSelectedLocation(
                          index, textController, searchResults);
                },
              );
            },
          ),
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultCircular),
            color: Colors.teal.shade200,
          ),
        ));
  }
}
