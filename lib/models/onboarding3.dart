import 'dart:convert';

class Onboarding3 {
  String user;
  String gstin_present;
  String gstin_num;
  String fssai_status;
  String fssai_expiry;
  Onboarding3({
    required this.user,
    required this.gstin_present,
    required this.gstin_num,
    required this.fssai_status,
    required this.fssai_expiry,
  });

  Onboarding3 copyWith({
    String? user,
    String? gstin_present,
    String? gstin_num,
    String? fssai_status,
    String? fssai_expiry,
  }) {
    return Onboarding3(
      user: user ?? this.user,
      gstin_present: gstin_present ?? this.gstin_present,
      gstin_num: gstin_num ?? this.gstin_num,
      fssai_status: fssai_status ?? this.fssai_status,
      fssai_expiry: fssai_expiry ?? this.fssai_expiry,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'gstin_present': gstin_present,
      'gstin_num': gstin_num,
      'fssai_status': fssai_status,
      'fssai_expiry': fssai_expiry,
    };
  }

  factory Onboarding3.fromMap(Map<String, dynamic> map) {
    return Onboarding3(
      user: map['user'],
      gstin_present: map['gstin_present'],
      gstin_num: map['gstin_num'],
      fssai_status: map['fssai_status'],
      fssai_expiry: map['fssai_expiry'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Onboarding3.fromJson(String source) =>
      Onboarding3.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Onboarding3(user: $user, gstin_present: $gstin_present, gstin_num: $gstin_num, fssai_status: $fssai_status, fssai_expiry: $fssai_expiry)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Onboarding3 &&
        other.user == user &&
        other.gstin_present == gstin_present &&
        other.gstin_num == gstin_num &&
        other.fssai_status == fssai_status &&
        other.fssai_expiry == fssai_expiry;
  }

  @override
  int get hashCode {
    return user.hashCode ^
        gstin_present.hashCode ^
        gstin_num.hashCode ^
        fssai_status.hashCode ^
        fssai_expiry.hashCode;
  }
}
