import 'dart:ffi';

class item {
  final String itemName;
  final int price;
  final int totalTickets;
  final String photo;
  final String category;

  const item({
    required this.itemName,
    required this.price,
    required this.photo,
    required this.totalTickets,
    required this.category,
  });

  factory item.fromJson(Map<String, dynamic> json) => item(
      itemName: json["itemName"],
      price: json["price"],
      totalTickets: json["totalTickets"],
      photo: json["photo"],
      category: json["category"]);

  Map<String, dynamic> toJson() => {
        "itemName": itemName,
        "price": price,
        "totalTickets": totalTickets,
        "photo": photo,
        "category": category,
      };
  item copy() => item(
      itemName: itemName,
      price: price,
      totalTickets: totalTickets,
      photo: photo,
      category: category);
}
