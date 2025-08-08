import 'package:flutter/material.dart';
import 'package:vitaro_app/domain/models/exercise_model.dart';
import 'package:vitaro_app/ui/widgets/exercises_list/workout_exercise_item.dart';

class ExercisesList extends StatelessWidget {
  final List<ExerciseModel> exercises;

  const ExercisesList({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...exercises.map(
                (e) => ClipOval(
                  child: Image.asset(
                    e.imagePath,
                    scale: 3.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.builder(
            itemCount: exercises.length,
            itemBuilder: (context, index) => WorkoutExerciseItem(
              exercise: exercises[index],
            ),
          ),
        ),
      ],
    );
  }
}
