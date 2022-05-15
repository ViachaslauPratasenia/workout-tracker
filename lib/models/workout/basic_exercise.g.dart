// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicExercise _$BasicExerciseFromJson(Map<String, dynamic> json) =>
    BasicExercise(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$BasicExerciseToJson(BasicExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
    };
