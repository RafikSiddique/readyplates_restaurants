import 'dart:convert';

class City {
  final int id;
  final String name;
  final int state_id;
  City({
    required this.id,
    required this.name,
    required this.state_id,
  });

  City copyWith({
    int? id,
    String? name,
    int? state_id,
  }) {
    return City(
      id: id ?? this.id,
      name: name ?? this.name,
      state_id: state_id ?? this.state_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'state_id': state_id,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id']?.toInt(),
      name: map['name'],
      state_id: map['state_id']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) => City.fromMap(json.decode(source));

  @override
  String toString() => 'City(id: $id, name: $name, state_id: $state_id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is City &&
        other.id == id &&
        other.name == name &&
        other.state_id == state_id;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ state_id.hashCode;
}
