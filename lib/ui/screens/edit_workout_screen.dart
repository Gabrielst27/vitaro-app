import 'package:flutter/material.dart';
import 'package:vitaro_app/domain/models/workouts_model.dart';
import 'package:vitaro_app/ui/widgets/edit_workout/edit_workout_form.dart';
import 'package:vitaro_app/ui/widgets/edit_workout/muscle_targets.dart';
import 'package:vitaro_app/ui/widgets/edit_workout/workout_exercise_item.dart';

class EditWorkoutScreen extends StatelessWidget {
  final WorkoutModel workout;

  const EditWorkoutScreen({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Editar',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            pinned: true,
            expandedHeight: 300,
            backgroundColor: Theme.of(
              context,
            ).colorScheme.surfaceContainerLow,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Theme.of(
                  context,
                ).colorScheme.surfaceContainerLow,
                child: Padding(
                  padding: const EdgeInsets.only(top: 128),
                  child: EditWorkoutForm(workout: workout),
                ),
              ),
            ),
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
              padding: const EdgeInsets.only(bottom: 64),
              child: TextButton.icon(
                onPressed: () {},
                label: const Text('Adicionar Exercício'),
                icon: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size(72, 44)),
        onPressed: () {},
        child: const Icon(
          Icons.check,
          size: 24,
        ),
      ),
    );
  }
}
