import 'package:json_annotation/json_annotation.dart';
import 'package:workout_tracker/models/categories.dart';

part 'exercise.g.dart';

@JsonSerializable()
class Exercise {
  final String? id;
  final String title;
  final String imagePath;
  final MainCategories categoryType;

  final String? description;

  Exercise({
    this.id,
    required this.title,
    required this.imagePath,
    required this.categoryType,
    this.description
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
