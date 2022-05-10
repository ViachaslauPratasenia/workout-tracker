import 'package:json_annotation/json_annotation.dart';
import 'package:workout_tracker/utils/images.dart';

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

List<Category> getMainCategories() {
  return [
    Category(title: 'Верх', imagePath: Images.upperBodyIcon),
    Category(title: 'Низ', imagePath: Images.lowerBodyIcon),
    Category(title: 'Кардио', imagePath: Images.cardioIcon),
  ];
}
