import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workout_tracker/models/workout/workout.dart';
import 'package:workout_tracker/utils/ui_kit/heading.dart';

class ExerciseExpandableList extends StatelessWidget {
  final Workout workout;

  const ExerciseExpandableList({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: workout.days.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Heading(
            'Day ${workout.days[index].number}',
            size: HeadingSize.h4,
          ),
          trailing: SizedBox.shrink(),
          children: getChildren(workout.days[index].number),
        );
      },
    );
  }

  List<Widget> getChildren(int dayId) {
    return [

    ];
  }
}
