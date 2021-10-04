import 'dart:convert';

class Onboarding1 {
  String user;
  String res_name;
  String own_name;
  String own_mobile;
  String res_city;
  String poc;
  String poc_number;

  Onboarding1({
    required this.user,
    required this.res_name,
    required this.own_name,
    required this.own_mobile,
    required this.res_city,
    required this.poc,
    required this.poc_number,
  });

  Onboarding1 copyWith({
    String? user,
    String? res_name,
    String? own_name,
    String? own_mobile,
    String? res_city,
    String? poc,
    String? poc_number,
  }) {
    return Onboarding1(
      user: user ?? this.user,
      res_name: res_name ?? this.res_name,
      own_name: own_name ?? this.own_name,
      own_mobile: own_mobile ?? this.own_mobile,
      res_city: res_city ?? this.res_city,
      poc: poc ?? this.poc,
      poc_number: poc_number ?? this.poc_number,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'res_name': res_name,
      'own_name': own_name,
      'own_mobile': own_mobile,
      'res_city': res_city,
      'poc': poc,
      'poc_number': poc_number,
    };
  }

  factory Onboarding1.fromMap(Map<String, dynamic> map) {
    return Onboarding1(
      user: map['user'],
      res_name: map['res_name'],
      own_name: map['own_name'],
      own_mobile: map['own_mobile'],
      res_city: map['res_city'],
      poc: map['poc'],
      poc_number: map['poc_number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Onboarding1.fromJson(String source) =>
      Onboarding1.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Onboarding1(user: $user, res_name: $res_name, own_name: $own_name, own_mobile: $own_mobile, res_city: $res_city, poc: $poc, poc_number: $poc_number)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Onboarding1 &&
        other.user == user &&
        other.res_name == res_name &&
        other.own_name == own_name &&
        other.own_mobile == own_mobile &&
        other.res_city == res_city &&
        other.poc == poc &&
        other.poc_number == poc_number;
  }

  @override
  int get hashCode {
    return user.hashCode ^
        res_name.hashCode ^
        own_name.hashCode ^
        own_mobile.hashCode ^
        res_city.hashCode ^
        poc.hashCode ^
        poc_number.hashCode;
  }
}
