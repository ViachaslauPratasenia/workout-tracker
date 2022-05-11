import 'package:json_annotation/json_annotation.dart';
import 'package:workout_tracker/models/categories.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final String? id;
  final String title;
  final String imagePath;

  Category({
    this.id,
    required this.title,
    required this.imagePath,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

extension CategoryExt on Category {
  MainCategories getTypeByCategory() {
    switch (title) {
      case 'Верх':
        return MainCategories.upperBody;
      case 'Низ':
        return MainCategories.lowerBody;
    }

    return MainCategories.cardio;
  }
}
