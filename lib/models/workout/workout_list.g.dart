// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutList _$WorkoutListFromJson(Map<String, dynamic> json) => WorkoutList(
      trainingList: (json['trainingList'] as List<dynamic>?)
              ?.map((e) => WorkoutTraining.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WorkoutListToJson(WorkoutList instance) =>
    <String, dynamic>{
      'trainingList': instance.trainingList,
    };
