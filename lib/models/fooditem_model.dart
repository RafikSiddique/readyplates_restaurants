import 'dart:convert';

import 'dart:math';

class FoodItemModel {
  String id;
  String name;
  String image;
  String description;
  bool veg;
  String menu;
  int spiceLevel;
  String price;
  FoodItemModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.veg,
    required this.menu,
    required this.spiceLevel,
    required this.price,
  });

  static List<FoodItemModel> foodItems = List.generate(
      20,
      (index) => FoodItemModel(
          id: index.toString(),
          name: "Food ${index + 1}",
          image:
              "https://images.everydayhealth.com/images/diet-nutrition/34da4c4e-82c3-47d7-953d-121945eada1e00-giveitup-unhealthyfood.jpg?sfvrsn=a31d8d32_0",
          description:
              "Food ${index + 1} Description, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          veg: index.isEven,
          menu: "",
          spiceLevel: Random().nextInt(5),
          price: "₹" + (Random().nextInt(1000)).toString()));

  FoodItemModel copyWith({
    String? id,
    String? name,
    String? image,
    String? description,
    bool? veg,
    String? menu,
    int? spiceLevel,
    String? price,
  }) {
    return FoodItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      veg: veg ?? this.veg,
      menu: menu ?? this.menu,
      spiceLevel: spiceLevel ?? this.spiceLevel,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'veg': veg,
      'menu': menu,
      'spiceLevel': spiceLevel,
      'price': price,
    };
  }

  factory FoodItemModel.fromMap(Map<String, dynamic> map) {
    return FoodItemModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      description: map['description'],
      veg: map['veg'],
      menu: map['menu'],
      spiceLevel: map['spiceLevel'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodItemModel.fromJson(String source) =>
      FoodItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FoodItemModel(id: $id, name: $name, image: $image, description: $description, veg: $veg, menu: $menu, spiceLevel: $spiceLevel, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FoodItemModel &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.description == description &&
        other.veg == veg &&
        other.menu == menu &&
        other.spiceLevel == spiceLevel &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        description.hashCode ^
        veg.hashCode ^
        menu.hashCode ^
        spiceLevel.hashCode ^
        price.hashCode;
  }
}
