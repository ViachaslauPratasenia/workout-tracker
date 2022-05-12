import 'package:json_annotation/json_annotation.dart';
import 'package:workout_tracker/models/workout/day.dart';

part 'workout_training.g.dart';

@JsonSerializable()
class WorkoutTraining {
  final int? id;
  final String title;
  final List<Day> days;

  final String? description;

  WorkoutTraining({
    this.id,
    required this.title,
    this.days = const [],
    this.description,
  });

  factory WorkoutTraining.fromJson(Map<String, dynamic> json) =>
      _$WorkoutTrainingFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutTrainingToJson(this);
}
