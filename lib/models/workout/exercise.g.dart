// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      basicExerciseId: json['exerciseId'] as int,
      sets: json['sets'] as int? ?? 1,
      setsRelaxInSeconds: json['setsRelaxInSeconds'] as int?,
      repeatCount: json['repeatCount'] as int?,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'exerciseId': instance.basicExerciseId,
      'sets': instance.sets,
      'setsRelaxInSeconds': instance.setsRelaxInSeconds,
      'repeatCount': instance.repeatCount,
    };
