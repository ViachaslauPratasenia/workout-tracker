import 'package:json_annotation/json_annotation.dart';

part 'train_exercise.g.dart';

@JsonSerializable()
class TrainExercise {
  final int id;
  final String name;
  final int sets;

  final int? setsRelaxInSeconds;
  final int? repeatCount;
  final String? description;

  TrainExercise({
    required this.id,
    required this.name,
    this.sets = 1,
    this.setsRelaxInSeconds,
    this.repeatCount,
    this.description,
  });

  factory TrainExercise.fromJson(Map<String, dynamic> json) =>
      _$TrainExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$TrainExerciseToJson(this);
}
