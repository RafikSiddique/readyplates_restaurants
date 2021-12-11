import 'dart:convert';

class FeedbackModel {
  final int id;
  final String overall_experience;
  final String taste;
  final String ambience;
  final String serving_time;
  final String feedback;
  final String image;
  final int restaurant;
  final int user;
  final int order;
  FeedbackModel({
    required this.order,
    required this.id,
    required this.overall_experience,
    required this.taste,
    required this.ambience,
    required this.serving_time,
    required this.feedback,
    required this.image,
    required this.restaurant,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'overall_experience': overall_experience,
      'taste': taste,
      'ambience': ambience,
      'serving_time': serving_time,
      'feedback': feedback,
      'image': image,
      'restaurant': restaurant,
      'user': user,
    };
  }

  factory FeedbackModel.fromMap(Map<String, dynamic> map) {
    return FeedbackModel(
      id: map['id']?.toInt(),
      overall_experience: map['overall_experience'],
      taste: map['taste'],
      ambience: map['ambience'],
      serving_time: map['serving_time'],
      feedback: map['feedback'],
      order: map['order'],
      image: map['image'],
      restaurant: map['restaurant']?.toInt(),
      user: map['user']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedbackModel.fromJson(String source) =>
      FeedbackModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FeedbackModel(id: $id, overall_experience: $overall_experience, taste: $taste, ambience: $ambience, serving_time: $serving_time, feedback: $feedback, image: $image, restaurant: $restaurant, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FeedbackModel &&
        other.id == id &&
        other.overall_experience == overall_experience &&
        other.taste == taste &&
        other.ambience == ambience &&
        other.serving_time == serving_time &&
        other.feedback == feedback &&
        other.image == image &&
        other.restaurant == restaurant &&
        other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        overall_experience.hashCode ^
        taste.hashCode ^
        ambience.hashCode ^
        serving_time.hashCode ^
        feedback.hashCode ^
        image.hashCode ^
        restaurant.hashCode ^
        user.hashCode;
  }
}
