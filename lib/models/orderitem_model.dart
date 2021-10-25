import 'dart:convert';

OrderItemModel orderItemModelFromJson(String str) =>
    OrderItemModel.fromJson(json.decode(str));

String orderItemModelToJson(OrderItemModel data) => json.encode(data.toJson());

class OrderItemModel {
  OrderItemModel({
    required this.status,
    required this.data,
  });

  String status;
  List<Datum> data;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
        status: json["Status"],
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.createdOn,
    required this.name,
    required this.quantity,
    required this.noOfTable,
    required this.noOfPeople,
    required this.time,
    required this.price,
    required this.tax,
    required this.pin,
    required this.user,
    required this.restaurant,
    required this.menu,
  });

  int id;
  DateTime createdOn;
  String name;
  int quantity;
  int noOfTable;
  int noOfPeople;
  String time;
  String price;
  String tax;
  int pin;
  int user;
  int restaurant;
  int menu;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        createdOn: DateTime.parse(json["created_on"]),
        name: json["name"],
        quantity: json["quantity"],
        noOfTable: json["no_of_table"],
        noOfPeople: json["no_of_people"],
        time: json["time"],
        price: json["price"],
        tax: json["tax"],
        pin: json["pin"],
        user: json["user"],
        restaurant: json["restaurant"],
        menu: json["menu"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_on": createdOn.toIso8601String(),
        "name": name,
        "quantity": quantity,
        "no_of_table": noOfTable,
        "no_of_people": noOfPeople,
        "time": time,
        "price": price,
        "tax": tax,
        "pin": pin,
        "user": user,
        "restaurant": restaurant,
        "menu": menu,
      };
}
