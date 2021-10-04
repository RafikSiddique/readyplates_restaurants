import 'dart:convert';

class Onboarding2 {
  String user;
  String address;
  String postal_code;
  String latitude;
  String longitude;

  Onboarding2({
    required this.user,
    required this.address,
    required this.postal_code,
    required this.latitude,
    required this.longitude,
  });

  Onboarding2 copyWith({
    String? user,
    String? address,
    String? postal_code,
    String? latitude,
    String? longitude,
  }) {
    return Onboarding2(
      user: user ?? this.user,
      address: address ?? this.address,
      postal_code: postal_code ?? this.postal_code,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'address': address,
      'postal_code': postal_code,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Onboarding2.fromMap(Map<String, dynamic> map) {
    return Onboarding2(
      user: map['user'],
      address: map['address'],
      postal_code: map['postal_code'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Onboarding2.fromJson(String source) =>
      Onboarding2.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Onboarding2(user: $user, address: $address, postal_code: $postal_code, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Onboarding2 &&
        other.user == user &&
        other.address == address &&
        other.postal_code == postal_code &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return user.hashCode ^
        address.hashCode ^
        postal_code.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
