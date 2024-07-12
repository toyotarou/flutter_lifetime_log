class SpendTimePlaceModel {
  SpendTimePlaceModel({
    required this.date,
    required this.time,
    required this.place,
    required this.price,
  });

  factory SpendTimePlaceModel.fromJson(Map<String, dynamic> json) =>
      SpendTimePlaceModel(
        date: DateTime.parse(json['date']),
        time: json['time'],
        place: json['place'],
        price: json['price'],
      );
  DateTime date;
  String time;
  String place;
  int price;

  Map<String, dynamic> toJson() => {
        'date':
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        'time': time,
        'place': place,
        'price': price,
      };
}
