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
              style: Theme.of(context).textTheme.titleMedium,
              decoration: InputDecoration(
                hintText: 'Insira o título',
                label: Text('Título'),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: DropdownButtonFormField<ESports>(
                    decoration: InputDecoration(
                      label: Text('Esporte'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                      fillColor: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerLowest,
                    ),
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
                Expanded(
                  child: DropdownButtonFormField<EWorkoutGoals>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerLowest,
                      label: Text('Objetivo'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
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
