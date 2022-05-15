import 'package:json_annotation/json_annotation.dart';

part 'basic_exercise.g.dart';

@JsonSerializable()
class BasicExercise {
  final int id;
  final String name;
  final String type;

  final String? description;

  BasicExercise({
    required this.id,
    required this.name,
    required this.type,
    this.description,
  });

  factory BasicExercise.fromJson(Map<String, dynamic> json) =>
      _$BasicExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$BasicExerciseToJson(this);
}
