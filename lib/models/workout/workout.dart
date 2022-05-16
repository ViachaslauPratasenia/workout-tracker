import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:workout_tracker/models/workout/day.dart';

part 'workout.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class Workout extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final List<Day> days;

  @HiveField(3)
  final String? description;

  const Workout({
    this.id,
    required this.title,
    this.days = const [],
    this.description,
  });

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutToJson(this);

  @override
  List<Object?> get props => [id, title, days, description];
}
