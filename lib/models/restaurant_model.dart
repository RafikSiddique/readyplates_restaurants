import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:readyplates_restaurants/utils/api_services.dart';

String getUrl(String url) {
  return !url.contains('http') ? ApiServices().baseUriImage + url : url;
}

class RestaurantModel {
  final int id;
  final List<Bio> bio;
  final String resName;
  final String own_name;
  final String own_mobile;
  final String res_city;
  final String poc;
  final String poc_number;
  final String address;
  final String address2;
  final String overall_experience;
  final String postal_code;
  final String latitude;
  final String longitude;
  final String gstin_present;
  final String gstin_num;
  final String fssai_status;
  final String fssai_expiry;
  final String kyc_image;
  final String gstin_image;
  final String fssai_image;
  final String type_of_estd;
  final List<String> types_of_cusine;
  final String start_time;
  final String end_time;
  final List<String> open_days;
  final int completed_till;
  final int user;
  RestaurantModel({
    required this.address2,
    required this.overall_experience,
    required this.id,
    required this.bio,
    required this.resName,
    required this.own_name,
    required this.own_mobile,
    required this.res_city,
    required this.poc,
    required this.poc_number,
    required this.address,
    required this.postal_code,
    required this.latitude,
    required this.longitude,
    required this.gstin_present,
    required this.gstin_num,
    required this.fssai_status,
    required this.fssai_expiry,
    required this.kyc_image,
    required this.gstin_image,
    required this.fssai_image,
    required this.type_of_estd,
    required this.types_of_cusine,
    required this.start_time,
    required this.end_time,
    required this.open_days,
    required this.completed_till,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bio': bio.map((x) => x.toMap()).toList(),
      'res_name': resName,
      'own_name': own_name,
      'own_mobile': own_mobile,
      'res_city': res_city,
      'poc': poc,
      'poc_number': poc_number,
      'address': address,
      'postal_code': postal_code,
      'latitude': latitude,
      'longitude': longitude,
      'gstin_present': gstin_present,
      'gstin_num': gstin_num,
      'fssai_status': fssai_status,
      'fssai_expiry': fssai_expiry,
      'kyc_image': kyc_image,
      'gstin_image': gstin_image,
      'fssai_image': fssai_image,
      'type_of_estd': type_of_estd,
      'types_of_cusine': types_of_cusine,
      'start_time': start_time,
      'end_time': end_time,
      'open_days': open_days,
      'completed_till': completed_till,
      'user': user,
    };
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
      id: map['id']?.toInt(),
      bio: List<Bio>.from(map['bio']?.map((x) => Bio.fromMap(x))),
      resName: map['res_name'] ?? "",
      address2: (map['address2'] ?? "0").toString(),
      overall_experience: map['overall_experience'].toString(),
      own_name: map['own_name'] ?? "",
      own_mobile: map['own_mobile'] ?? "",
      res_city: map['res_city'] ?? "",
      poc: map['poc'] ?? "",
      poc_number: map['poc_number'] ?? "",
      address: map['address'].toString(),
      postal_code: map['postal_code'] ?? "",
      latitude: map['latitude'] ?? "",
      longitude: map['longitude'] ?? "",
      gstin_present: map['gstin_present'] ?? "",
      gstin_num: map['gstin_num'] ?? "",
      fssai_status: map['fssai_status'] ?? "",
      fssai_expiry: map['fssai_expiry'] ?? "",
      kyc_image: map['kyc_image'] ?? "",
      gstin_image: map['gstin_image'] ?? "",
      fssai_image: map['fssai_image'] ?? "",
      type_of_estd: map['type_of_estd'] ?? "",
      types_of_cusine: map['types_of_cusine'] != null
          ? List<String>.from(map['types_of_cusine']
              .toString()
              .substring(1, map['types_of_cusine'].toString().length - 1)
              .split(',')
              .map((e) => e.trim().trimRight().trimLeft()))
          : [],
      start_time: map['start_time'] ?? "",
      end_time: map['end_time'] ?? "",
      open_days: map['open_days'] != null
          ? List<String>.from(map['open_days']
              .toString()
              .substring(1, map['open_days'].toString().length - 1)
              .split(',')
              .map((e) => e.trim().trimRight().trimLeft()))
          : [],
      completed_till: map['completed_till']?.toInt(),
      user: map['user']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantModel.fromJson(String source) =>
      RestaurantModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RestaurantModel(id: $id, bio: $bio, res_name: $resName, own_name: $own_name, own_mobile: $own_mobile, res_city: $res_city, poc: $poc, poc_number: $poc_number, address: $address, postal_code: $postal_code, latitude: $latitude, longitude: $longitude, gstin_present: $gstin_present, gstin_num: $gstin_num, fssai_status: $fssai_status, fssai_expiry: $fssai_expiry, kyc_image: $kyc_image, gstin_image: $gstin_image, fssai_image: $fssai_image, type_of_estd: $type_of_estd, types_of_cusine: $types_of_cusine, start_time: $start_time, end_time: $end_time, open_days: $open_days, completed_till: $completed_till, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RestaurantModel &&
        other.id == id &&
        listEquals(other.bio, bio) &&
        other.resName == resName &&
        other.own_name == own_name &&
        other.own_mobile == own_mobile &&
        other.res_city == res_city &&
        other.poc == poc &&
        other.poc_number == poc_number &&
        other.address == address &&
        other.postal_code == postal_code &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.gstin_present == gstin_present &&
        other.gstin_num == gstin_num &&
        other.fssai_status == fssai_status &&
        other.fssai_expiry == fssai_expiry &&
        other.kyc_image == kyc_image &&
        other.gstin_image == gstin_image &&
        other.fssai_image == fssai_image &&
        other.type_of_estd == type_of_estd &&
        other.types_of_cusine == types_of_cusine &&
        other.start_time == start_time &&
        other.end_time == end_time &&
        other.open_days == open_days &&
        other.completed_till == completed_till &&
        other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        bio.hashCode ^
        resName.hashCode ^
        own_name.hashCode ^
        own_mobile.hashCode ^
        res_city.hashCode ^
        poc.hashCode ^
        poc_number.hashCode ^
        address.hashCode ^
        postal_code.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        gstin_present.hashCode ^
        gstin_num.hashCode ^
        fssai_status.hashCode ^
        fssai_expiry.hashCode ^
        kyc_image.hashCode ^
        gstin_image.hashCode ^
        fssai_image.hashCode ^
        type_of_estd.hashCode ^
        types_of_cusine.hashCode ^
        start_time.hashCode ^
        end_time.hashCode ^
        open_days.hashCode ^
        completed_till.hashCode ^
        user.hashCode;
  }
}

class Bio {
  final int id;
  final String description;
  final String no_of_tables;
  final String max_table_size;
  final String cost_for_two;
  final String servingTime;
  final String recurring_event_date;
  final String recur_freq;
  final String event_start;
  final String event_end;
  final String event_desc;
  final String front_fascia_day;
  final String front_fascia_night;
  final String street_view;
  final String entrance;
  final String ambience1;
  final String ambience2;
  final String ambience3;
  final String ambience4;
  final String food1;
  final String food2;
  final String food3;
  final String food4;
  final String cv19prec1;
  final String cv19prec2;
  final String cv19prec3;
  final String cv19prec4;
  final int completed_till;
  final int user;
  Bio({
    required this.id,
    required this.description,
    required this.no_of_tables,
    required this.max_table_size,
    required this.cost_for_two,
    required this.servingTime,
    required this.recurring_event_date,
    required this.recur_freq,
    required this.event_start,
    required this.event_end,
    required this.event_desc,
    required this.front_fascia_day,
    required this.front_fascia_night,
    required this.street_view,
    required this.entrance,
    required this.ambience1,
    required this.ambience2,
    required this.ambience3,
    required this.ambience4,
    required this.food1,
    required this.food2,
    required this.food3,
    required this.food4,
    required this.cv19prec1,
    required this.cv19prec2,
    required this.cv19prec3,
    required this.cv19prec4,
    required this.completed_till,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'no_of_tables': no_of_tables,
      'max_table_size': max_table_size,
      'cost_for_two': cost_for_two,
      'serving_time': servingTime,
      'recurring_event_date': recurring_event_date,
      'recur_freq': recur_freq,
      'event_start': event_start,
      'event_end': event_end,
      'event_desc': event_desc,
      'front_fascia_day': front_fascia_day,
      'front_fascia_night': front_fascia_night,
      'street_view': street_view,
      'entrance': entrance,
      'ambience1': ambience1,
      'ambience2': ambience2,
      'ambience3': ambience3,
      'ambience4': ambience4,
      'food1': food1,
      'food2': food2,
      'food3': food3,
      'food4': food4,
      'cv19prec1': cv19prec1,
      'cv19prec2': cv19prec2,
      'cv19prec3': cv19prec3,
      'cv19prec4': cv19prec4,
      'completed_till': completed_till,
      'user': user,
    };
  }

  factory Bio.fromMap(Map<String, dynamic> map) {
    return Bio(
      id: map['id']?.toInt(),
      description: map['description'] ?? "",
      no_of_tables: map['no_of_tables'] ?? "",
      max_table_size: map['max_table_size'] ?? "",
      cost_for_two: map['cost_for_two'] ?? "",
      servingTime: map['serving_time'] ?? "",
      recurring_event_date: map['recurring_event_date'] ?? "",
      recur_freq: map['recur_freq'] ?? "",
      event_start: map['event_start'] ?? "",
      event_end: map['event_end'] ?? "",
      event_desc: map['event_desc'] ?? "",
      front_fascia_day: getUrl(map['front_fascia_day'] ?? ""),
      front_fascia_night: getUrl(map['front_fascia_night'] ?? ""),
      street_view: getUrl(map['street_view'] ?? ""),
      entrance: getUrl(map['entrance'] ?? ""),
      ambience1: getUrl(map['ambience1'] ?? ""),
      ambience2: getUrl(map['ambience2'] ?? ""),
      ambience3: getUrl(map['ambience3'] ?? ""),
      ambience4: getUrl(map['ambience4'] ?? ""),
      food1: getUrl(map['food1'] ?? ""),
      food2: getUrl(map['food2'] ?? ""),
      food3: getUrl(map['food3'] ?? ""),
      food4: getUrl(map['food4'] ?? ""),
      cv19prec1: getUrl(map['cv19prec1'] ?? ""),
      cv19prec2: getUrl(map['cv19prec2'] ?? ""),
      cv19prec3: getUrl(map['cv19prec3'] ?? ""),
      cv19prec4: getUrl(map['cv19prec4'] ?? ""),
      completed_till: map['completed_till']?.toInt(),
      user: map['user']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bio.fromJson(String source) => Bio.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Bio(id: $id, description: $description, no_of_tables: $no_of_tables, max_table_size: $max_table_size, cost_for_two: $cost_for_two, serving_time: $servingTime, recurring_event_date: $recurring_event_date, recur_freq: $recur_freq, event_start: $event_start, event_end: $event_end, event_desc: $event_desc, front_fascia_day: $front_fascia_day, front_fascia_night: $front_fascia_night, street_view: $street_view, entrance: $entrance, ambience1: $ambience1, ambience2: $ambience2, ambience3: $ambience3, ambience4: $ambience4, food1: $food1, food2: $food2, food3: $food3, food4: $food4, cv19prec1: $cv19prec1, cv19prec2: $cv19prec2, cv19prec3: $cv19prec3, cv19prec4: $cv19prec4, completed_till: $completed_till, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Bio &&
        other.id == id &&
        other.description == description &&
        other.no_of_tables == no_of_tables &&
        other.max_table_size == max_table_size &&
        other.cost_for_two == cost_for_two &&
        other.servingTime == servingTime &&
        other.recurring_event_date == recurring_event_date &&
        other.recur_freq == recur_freq &&
        other.event_start == event_start &&
        other.event_end == event_end &&
        other.event_desc == event_desc &&
        other.front_fascia_day == front_fascia_day &&
        other.front_fascia_night == front_fascia_night &&
        other.street_view == street_view &&
        other.entrance == entrance &&
        other.ambience1 == ambience1 &&
        other.ambience2 == ambience2 &&
        other.ambience3 == ambience3 &&
        other.ambience4 == ambience4 &&
        other.food1 == food1 &&
        other.food2 == food2 &&
        other.food3 == food3 &&
        other.food4 == food4 &&
        other.cv19prec1 == cv19prec1 &&
        other.cv19prec2 == cv19prec2 &&
        other.cv19prec3 == cv19prec3 &&
        other.cv19prec4 == cv19prec4 &&
        other.completed_till == completed_till &&
        other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        no_of_tables.hashCode ^
        max_table_size.hashCode ^
        cost_for_two.hashCode ^
        servingTime.hashCode ^
        recurring_event_date.hashCode ^
        recur_freq.hashCode ^
        event_start.hashCode ^
        event_end.hashCode ^
        event_desc.hashCode ^
        front_fascia_day.hashCode ^
        front_fascia_night.hashCode ^
        street_view.hashCode ^
        entrance.hashCode ^
        ambience1.hashCode ^
        ambience2.hashCode ^
        ambience3.hashCode ^
        ambience4.hashCode ^
        food1.hashCode ^
        food2.hashCode ^
        food3.hashCode ^
        food4.hashCode ^
        cv19prec1.hashCode ^
        cv19prec2.hashCode ^
        cv19prec3.hashCode ^
        cv19prec4.hashCode ^
        completed_till.hashCode ^
        user.hashCode;
  }
}
