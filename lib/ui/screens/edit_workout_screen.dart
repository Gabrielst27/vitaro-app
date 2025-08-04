import 'package:flutter/material.dart';
import 'package:vitaro_app/domain/models/workouts_model.dart';
import 'package:vitaro_app/domain/services/exercises_service.dart';
import 'package:vitaro_app/ui/widgets/edit_workout_form.dart';
import 'package:vitaro_app/ui/widgets/exercises_list/exercises_list.dart';

class EditWorkoutScreen extends StatelessWidget {
  final WorkoutModel workout;

  const EditWorkoutScreen({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    final exercisesService = ExercisesService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        title: Text(
          'Editar',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.surfaceContainer,
              child: EditWorkoutForm(
                workout: workout,
              ),
            ),
            const SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...workout.exercises.map(
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
              child: ExercisesList(
                exercises: workout.exercises,
              ),
            ),
            TextButton.icon(
              icon: Icon(Icons.add),
              onPressed: () {},
              label: Text('Adicionar exercício'),
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
