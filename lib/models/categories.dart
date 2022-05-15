import 'package:workout_tracker/models/category.dart';
import 'package:workout_tracker/models/workout//exercise.dart';
import 'package:workout_tracker/utils/images.dart';

enum CategoriesType { categories, exercises }

enum MainCategories {
  upperBody,
  lowerBody,
  cardio,
}

List<Category> getMainCategories() {
  return [
    Category(title: 'Готовая тренировка', imagePath: Images.upperBodyIcon),
    Category(title: 'Список Упражнений', imagePath: Images.lowerBodyIcon),
  ];
}

List<Category> getExerciseCategories() {
  return [
    Category(title: 'Верх', imagePath: Images.upperBodyIcon),
    Category(title: 'Низ', imagePath: Images.lowerBodyIcon),
    Category(title: 'Кардио', imagePath: Images.cardioIcon),
  ];
}

List<Exercise> getExercises() {
  return [
    // Exercise(
    //   id: 1,
    //   name: 'Прогулка 4км/ч',
    //   type: MainCategories.cardio.name,
    // ),
    // Exercise(
    //   id: 1,
    //   name: 'Ходьба 6км/ч',
    //   type: MainCategories.cardio.name,
    // ),
    // Exercise(
    //   id: 1,
    //   name: 'Бег 12км/ч',
    //   type: MainCategories.cardio.name,
    // ),
  ];
}

// List<Exercise> getExercisesByCategory(MainCategories category) {
//   return getExercises()
//       .where((element) => element.type == category.name)
//       .toList();
// }
