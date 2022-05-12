// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_training.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutTraining _$WorkoutTrainingFromJson(Map<String, dynamic> json) =>
    WorkoutTraining(
      id: json['id'] as int?,
      title: json['title'] as String,
      days: (json['days'] as List<dynamic>?)
              ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      description: json['description'] as String?,
    );

Map<String, dynamic> _$WorkoutTrainingToJson(WorkoutTraining instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'days': instance.days,
      'description': instance.description,
    };
