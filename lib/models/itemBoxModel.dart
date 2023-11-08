class ItemBox {
  final String itemName;
  final String details;
  final String category;

  const ItemBox({
    required this.itemName,
    required this.details,
    required this.category,
  });

  factory ItemBox.fromJson(Map<String, dynamic> json) => ItemBox(
      itemName: json["itemName"],
      details: json["details"],
      category: json["category"]);

  Map<String, dynamic> toJson() => {
        "itemName": itemName,
        "details": details,
        "category": category,
      };
  ItemBox copy() =>
      ItemBox(itemName: itemName, details: details, category: category);
}
