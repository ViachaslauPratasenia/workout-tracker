import 'package:json_annotation/json_annotation.dart';
import 'package:workout_tracker/models/train/train_exercise.dart';

part 'day.g.dart';

@JsonSerializable()
class Day {
  final int number;
  final List<TrainExercise> exercises;

  //если description != null значит там значение 'Отдых'
  final String? description;

  Day({
    this.number = 0,
    this.exercises = const [],
    this.description,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}
