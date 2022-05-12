// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      sets: json['sets'] as int? ?? 1,
      setsRelaxInSeconds: json['setsRelaxInSeconds'] as int?,
      repeatCount: json['repeatCount'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sets': instance.sets,
      'type': instance.type,
      'setsRelaxInSeconds': instance.setsRelaxInSeconds,
      'repeatCount': instance.repeatCount,
      'description': instance.description,
    };
