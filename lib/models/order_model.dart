class Order {
  int idOrder = 0;
  double scoresStart = 0.0;
  String nameDriver = '';
  String imageDriver = '';
  String status = '';
  Order(
      {required this.idOrder,
      required this.scoresStart,
      required this.nameDriver,
      required this.imageDriver,
      required this.status});
}
