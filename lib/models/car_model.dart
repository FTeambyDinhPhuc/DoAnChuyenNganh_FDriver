import 'dart:convert';

CarModel carModelFromJson(String str) => CarModel.fromJson(json.decode(str));

String carModelToJson(CarModel data) => json.encode(data.toJson());

class CarModel {
  CarModel({
    required this.idXe,
    required this.idTaixe,
    required this.bienso,
    required this.soghe,
    required this.hangxe,
  });

  int idXe;
  int idTaixe;
  String bienso;
  int soghe;
  String hangxe;

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        idXe: json["id_xe"],
        idTaixe: json["id_taixe"],
        bienso: json["bienso"],
        soghe: json["soghe"],
        hangxe: json["hangxe"],
      );

  Map<String, dynamic> toJson() => {
        "id_xe": idXe,
        "id_taixe": idTaixe,
        "bienso": bienso,
        "soghe": soghe,
        "hangxe": hangxe,
      };
}
