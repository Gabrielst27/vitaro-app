import 'package:flutter/material.dart';
import 'package:vitaro_app/domain/enums/muscular_groups_enum.dart';
import 'package:vitaro_app/domain/models/workouts_model.dart';
import 'package:vitaro_app/ui/screens/edit_workout_screen.dart';

class WorkoutItem extends StatefulWidget {
  final WorkoutModel workout;

  const WorkoutItem({super.key, required this.workout});

  @override
  State<WorkoutItem> createState() => _WorkoutItemState();
}

class _WorkoutItemState extends State<WorkoutItem>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _editWorkout() {
    Navigator.of(
      context,
    ).push(
      MaterialPageRoute(
        builder: (context) => EditWorkoutScreen(
          workout: widget.workout,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpanded,
      child: Card(
        color: Theme.of(context).colorScheme.surfaceContainer,
        margin: EdgeInsets.all(8),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      //TODO
                      'Seg',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        widget.workout.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: _toggleExpanded,
                      icon: Icon(
                        _isExpanded
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        size: 32,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedContainer(
                height: _isExpanded
                    ? widget.workout.exercises.length > 2
                          ? 150
                          : 110
                    : 0,
                duration: Duration(milliseconds: 200),
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...widget.workout.exercises.map(
                        (exercise) => ListTile(
                          leading: CircleAvatar(
                            child: ClipOval(
                              child: Image.asset(
                                exercise.muscularGroup.imagePath,
                              ),
                            ),
                          ),
                          title: Text(exercise.name),
                          trailing: Text(
                            exercise.series != null
                                ? '${exercise.series!.length} séries'
                                : '0 séries',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Exercícios: ${widget.workout.exercises.length}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  //TODO
                  Text(
                    'Tempo estimado: 40 min',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      size: 24,
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
                  IconButton(
                    onPressed: _editWorkout,
                    icon: Icon(
                      Icons.edit,
                      size: 24,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
