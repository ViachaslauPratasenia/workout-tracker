import 'package:json_annotation/json_annotation.dart';
import 'package:workout_tracker/models/train/day.dart';

part 'training_plan.g.dart';

@JsonSerializable()
class TrainingPlan {
  final String? id;
  final String title;
  final List<Day> days;

  final String? description;

  TrainingPlan({
    this.id,
    required this.title,
    this.days = const [],
    this.description,
  });

  factory TrainingPlan.fromJson(Map<String, dynamic> json) =>
      _$TrainingPlanFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingPlanToJson(this);
}
