// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      id: json['id'] as String?,
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      categoryType: $enumDecode(_$MainCategoriesEnumMap, json['categoryType']),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imagePath': instance.imagePath,
      'categoryType': _$MainCategoriesEnumMap[instance.categoryType],
      'description': instance.description,
    };

const _$MainCategoriesEnumMap = {
  MainCategories.upperBody: 'upperBody',
  MainCategories.lowerBody: 'lowerBody',
  MainCategories.cardio: 'cardio',
};
