// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      number: json['number'] as int? ?? 0,
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) => TrainExercise.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      description: json['description'] as String?,
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'number': instance.number,
      'exercises': instance.exercises,
      'description': instance.description,
    };
