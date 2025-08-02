import 'package:flutter/material.dart';
import 'package:vitaro_app/domain/models/workouts_model.dart';
import 'package:vitaro_app/ui/widgets/edit_workout_form.dart';

class EditWorkoutScreen extends StatelessWidget {
  final WorkoutModel workout;

  const EditWorkoutScreen({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Editar',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: EditWorkoutForm(
            workout: workout,
          ),
        ),
      ),
    );
  }
}
