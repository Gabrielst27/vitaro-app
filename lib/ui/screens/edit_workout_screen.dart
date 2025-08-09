import 'package:flutter/material.dart';
import 'package:vitaro_app/domain/models/workouts_model.dart';
import 'package:vitaro_app/ui/widgets/edit_workout/edit_workout_header.dart';
import 'package:vitaro_app/ui/widgets/edit_workout/muscle_targets.dart';
import 'package:vitaro_app/ui/widgets/edit_workout/workout_exercise_item.dart';

class EditWorkoutScreen extends StatelessWidget {
  final WorkoutModel workout;

  const EditWorkoutScreen({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        title: Text(
          'Editar',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: EditWorkoutHeader(workout: workout),
            ),
            SliverPersistentHeader(
              delegate: MuscleTargets(exercises: workout.exercises),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    WorkoutExerciseItem(exercise: workout.exercises[index]),
                childCount: workout.exercises.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextButton.icon(
                  onPressed: () {},
                  label: Text('Adicionar Exercício'),
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size(72, 44)),
        onPressed: () {},
        child: Icon(
          Icons.check,
          size: 24,
        ),
      ),
    );
  }
}
