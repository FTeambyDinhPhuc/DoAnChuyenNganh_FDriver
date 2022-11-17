import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    required this.idChuyenxe,
    this.idTaixe,
    required this.idKhachhang,
    required this.diemdon,
    required this.diemden,
    required this.khuvucdon,
    required this.ngaydon,
    required this.giodon,
    required this.loaixe,
    required this.quangduong,
    required this.thanhtien,
    required this.trangthai,
    this.danhgia,
  });

  int idChuyenxe;
  int? idTaixe;
  int idKhachhang;
  String diemdon;
  String diemden;
  String khuvucdon;
  String ngaydon;
  String giodon;
  int loaixe;
  int quangduong;
  int thanhtien;
  String trangthai;
  int? danhgia;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        idChuyenxe: json["id_chuyenxe"],
        idTaixe: json["id_taixe"],
        idKhachhang: json["id_khachhang"],
        diemdon: json["diemdon"],
        diemden: json["diemden"],
        khuvucdon: json["khuvucdon"],
        ngaydon: json["ngaydon"],
        giodon: json["giodon"],
        loaixe: json["loaixe"],
        quangduong: json["quangduong"],
        thanhtien: json["thanhtien"],
        trangthai: json["trangthai"],
        danhgia: json["danhgia"],
      );

  Map<String, dynamic> toJson() => {
        "id_chuyenxe": idChuyenxe,
        "id_taixe": idTaixe,
        "id_khachhang": idKhachhang,
        "diemdon": diemdon,
        "diemden": diemden,
        "khuvucdon": khuvucdon,
        "ngaydon": ngaydon,
        "giodon": giodon,
        "loaixe": loaixe,
        "quangduong": quangduong,
        "thanhtien": thanhtien,
        "trangthai": trangthai,
        "danhgia": danhgia,
      };
}
