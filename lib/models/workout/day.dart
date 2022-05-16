import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:workout_tracker/models/workout/exercise.dart';

part 'day.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Day extends Equatable {
  @HiveField(0)
  final int number;
  @HiveField(1)
  final List<Exercise> exercises;

  //если description != null значит там значение 'Отдых'
  @HiveField(2)
  final String? description;

  const Day({
    this.number = 0,
    this.exercises = const [],
    this.description,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);

  @override
  List<Object?> get props => [number, exercises];
}
