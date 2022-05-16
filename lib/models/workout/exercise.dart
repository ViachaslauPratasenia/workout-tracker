import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Exercise extends Equatable {
  @HiveField(0)
  @JsonKey(name: 'exerciseId')
  final int basicExerciseId;
  @HiveField(1)
  final int sets;

  @HiveField(2)
  final int? setsRelaxInSeconds;
  @HiveField(3)
  final int? repeatCount;

  const Exercise({
    required this.basicExerciseId,
    this.sets = 1,
    this.setsRelaxInSeconds,
    this.repeatCount,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);

  @override
  List<Object?> get props => [basicExerciseId, sets, setsRelaxInSeconds, repeatCount];
}
