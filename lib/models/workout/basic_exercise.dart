import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basic_exercise.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class BasicExercise extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String type;

  @HiveField(3)
  final String? description;

  const BasicExercise({
    required this.id,
    required this.name,
    required this.type,
    this.description,
  });

  @override
  List<Object?> get props => [id, name, type, description];

  factory BasicExercise.fromJson(Map<String, dynamic> json) =>
      _$BasicExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$BasicExerciseToJson(this);
}
