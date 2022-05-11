// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'train_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainExercise _$TrainExerciseFromJson(Map<String, dynamic> json) =>
    TrainExercise(
      id: json['id'] as int,
      name: json['name'] as String,
      sets: json['sets'] as int? ?? 1,
      setsRelaxInSeconds: json['setsRelaxInSeconds'] as int?,
      repeatCount: json['repeatCount'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TrainExerciseToJson(TrainExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sets': instance.sets,
      'setsRelaxInSeconds': instance.setsRelaxInSeconds,
      'repeatCount': instance.repeatCount,
      'description': instance.description,
    };
