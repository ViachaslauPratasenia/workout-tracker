// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingPlan _$TrainingPlanFromJson(Map<String, dynamic> json) => TrainingPlan(
      id: json['id'] as String?,
      title: json['title'] as String,
      days: (json['days'] as List<dynamic>?)
              ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TrainingPlanToJson(TrainingPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'days': instance.days,
      'description': instance.description,
    };
