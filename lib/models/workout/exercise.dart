import 'package:json_annotation/json_annotation.dart';

part 'exercise.g.dart';

@JsonSerializable()
class Exercise {
  @JsonKey(name: 'exerciseId')
  final int basicExerciseId;
  final int sets;

  final int? setsRelaxInSeconds;
  final int? repeatCount;

  Exercise({
    required this.basicExerciseId,
    this.sets = 1,
    this.setsRelaxInSeconds,
    this.repeatCount,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
