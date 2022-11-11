import 'package:fdriver/models/address_component_model.dart';
import 'package:fdriver/models/geometry.dart';

class Place {
  final Geometry geometry;
  final List<AddressComponent> addressComponents;
  final String name;
  //final String vicinity;

  Place({
    required this.geometry,
    required this.addressComponents,
    required this.name,
  });

  factory Place.fromJson(Map<dynamic, dynamic> json) {
    return Place(
      geometry: Geometry.fromJson(json['geometry']),
      addressComponents: List<AddressComponent>.from(
          json["address_components"].map((x) => AddressComponent.fromJson(x))),
      name: json['formatted_address'],
    );
  }
}
