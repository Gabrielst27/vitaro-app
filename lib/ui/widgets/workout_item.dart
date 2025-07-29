import 'package:flutter/material.dart';
import 'package:vitaro_app/domain/models/workouts_model.dart';

class WorkoutItem extends StatelessWidget {
  final WorkoutModel workout;

  const WorkoutItem({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.calculate),
                Text(
                  workout.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.errorContainer,
                ),
              ],
            ),
            const SizedBox(height: 32),
            if (workout.exercises.isNotEmpty)
              ...workout.exercises.map((exercise) {
                return Text(exercise.name);
              }),
            if (workout.exercises.length > 3) const Text('...'),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle,
                    size: 48,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
