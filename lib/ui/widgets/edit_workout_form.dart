import 'package:flutter/material.dart';
import 'package:vitaro_app/domain/enums/sports_enum.dart';
import 'package:vitaro_app/domain/enums/workout_goals_enum.dart';
import 'package:vitaro_app/domain/models/workouts_model.dart';

class EditWorkoutForm extends StatefulWidget {
  final WorkoutModel workout;

  const EditWorkoutForm({super.key, required this.workout});

  @override
  State<EditWorkoutForm> createState() => _EditWorkoutFormState();
}

class _EditWorkoutFormState extends State<EditWorkoutForm> {
  final _formKey = GlobalKey<FormState>();
  final _currentSportFilter = ESports.bodybuilding;
  final _currentWorkoutGoal = EWorkoutGoals.hypertrophy;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              initialValue: widget.workout.title,
              decoration: InputDecoration(
                hintText: 'Insira o título',
                label: Text('Título'),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<ESports>(
                    decoration: InputDecoration(label: Text('Esporte')),
                    dropdownColor: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerLow,
                    value: _currentSportFilter,
                    items: ESports.values.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          sportLabel(value),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: DropdownButtonFormField<EWorkoutGoals>(
                    decoration: InputDecoration(label: Text('Objetivo')),
                    dropdownColor: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerLow,
                    value: _currentWorkoutGoal,
                    items: EWorkoutGoals.values.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          goalLabel(value),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {},
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
