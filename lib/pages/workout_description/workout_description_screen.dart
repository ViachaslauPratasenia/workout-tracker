import 'package:flutter/material.dart';
import 'package:workout_tracker/models/workout/workout.dart';
import 'package:workout_tracker/pages/workout_description/components/description_title.dart';
import 'package:workout_tracker/pages/workout_description/components/exercise_expandable_list.dart';
import 'package:workout_tracker/utils/ui_kit/app_bar.dart';
import 'package:workout_tracker/utils/ui_kit/base_screen.dart';

class WorkoutDescriptionScreen extends StatelessWidget {
  final Workout workout;

  const WorkoutDescriptionScreen({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: CustomAppBar(
        titleStr: workout.title,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          DescriptionTitle(workout: workout),
          SizedBox(height: 16,),
          ExerciseExpandableList(workout: workout),
        ],
      ),
    );
  }
}
