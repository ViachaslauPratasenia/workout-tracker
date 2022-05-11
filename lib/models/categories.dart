import 'package:workout_tracker/models/category.dart';
import 'package:workout_tracker/models/exercise.dart';
import 'package:workout_tracker/utils/images.dart';

enum MainCategories {
  upperBody,
  lowerBody,
  cardio,
}

List<Category> getMainCategories() {
  return [
    Category(title: 'Верх', imagePath: Images.upperBodyIcon),
    Category(title: 'Низ', imagePath: Images.lowerBodyIcon),
    Category(title: 'Кардио', imagePath: Images.cardioIcon),
  ];
}

List<Exercise> getExercises() {
  return [
    Exercise(
      title: 'Прогулка 4км/ч',
      imagePath: '',
      categoryType: MainCategories.cardio,
    ),
    Exercise(
      title: 'Ходьба 6км/ч',
      imagePath: '',
      categoryType: MainCategories.cardio,
    ),
    Exercise(
      title: 'Бег 12км/ч',
      imagePath: '',
      categoryType: MainCategories.cardio,
    ),
  ];
}

List<Exercise> getExercisesByCategory(MainCategories category) {
  return getExercises()
      .where((element) => element.categoryType == category)
      .toList();
}
