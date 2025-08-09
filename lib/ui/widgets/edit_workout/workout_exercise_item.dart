import 'package:flutter/material.dart';
import 'package:vitaro_app/domain/enums/muscular_groups_enum.dart';
import 'package:vitaro_app/domain/models/exercise_model.dart';

class WorkoutExerciseItem extends StatelessWidget {
  final ExerciseModel exercise;

  const WorkoutExerciseItem({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 24,
              children: [
                ClipOval(
                  child: Image.asset(
                    exercise.muscularGroup.imagePath,
                    scale: 4,
                  ),
                ),
                Text(exercise.name, textAlign: TextAlign.center),
              ],
            ),
          ),
          subtitle: exercise.series == null
              ? null
              : Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Séries',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 16),
                      Table(
                        children: [
                          TableRow(
                            children: [
                              Text(
                                'Reps',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Descanso',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Técnica',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          ...exercise.series!.map(
                            (serie) => TableRow(
                              children: [
                                SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      '${serie.reps}',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSurface,
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      '${serie.restInSeconds}s',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSurface,
                                          ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      serie.technique.isNotEmpty
                                          ? serie.technique
                                          : 'N/D',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSurface,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
