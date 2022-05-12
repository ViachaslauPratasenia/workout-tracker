import 'package:json_annotation/json_annotation.dart';

part 'exercise.g.dart';

@JsonSerializable()
class Exercise {
  final int id;
  final String name;
  final int sets;
  final String type;

  final int? setsRelaxInSeconds;
  final int? repeatCount;
  final String? description;

  Exercise({
    required this.id,
    required this.name,
    required this.type,
    this.sets = 1,
    this.setsRelaxInSeconds,
    this.repeatCount,
    this.description,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
