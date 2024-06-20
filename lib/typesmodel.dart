import 'dart:convert';

List<Items> itemsFromJson(String str) =>
    List<Items>.from(json.decode(str).map((x) => Items.fromJson(x)));

String itemsToJson(List<Items> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Items {
  String id;
  String name;
  int quantity;
  int v;

  Items({
    required this.id,
    required this.name,
    required this.quantity,
    required this.v,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        id: json["_id"],
        name: json["name"],
        quantity: json["quantity"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "quantity": quantity,
        "__v": v,
      };
}
