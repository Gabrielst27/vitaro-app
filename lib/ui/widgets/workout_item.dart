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
          padding: EdgeInsets.symmetric(vertical: 16),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,
            child: Column(
              children: [
                Row(
                  spacing: 24,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.workout.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: _isExpanded ? null : 1,
                        overflow: _isExpanded
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (widget.workout.exercises.isNotEmpty)
                  for (
                    int i = 0;
                    i < widget.workout.exercises.length && i <= 1;
                    i++
                  )
                    Container(
                      color: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerLowest,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            spacing: 16,
                            children: [
                              CircleAvatar(
                                radius: 24,
                                child: ClipOval(
                                  child: Image.asset(
                                    widget
                                        .workout
                                        .exercises[i]
                                        .muscularGroup
                                        .imagePath,
                                  ),
                                ),
                              ),
                              Text(
                                '${widget.workout.exercises[i].series!.length}x ${widget.workout.exercises[i].name}',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                if (_isExpanded)
                  for (int i = 2; i < widget.workout.exercises.length; i++)
                    Container(
                      color: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerLowest,
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        spacing: 16,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            child: ClipOval(
                              child: Image.asset(
                                widget
                                    .workout
                                    .exercises[i]
                                    .muscularGroup
                                    .imagePath,
                              ),
                            ),
                          ),
                          Text(
                            '${widget.workout.exercises[i].series!.length}x ${widget.workout.exercises[i].name}',
                          ),
                        ],
                      ),
                    ),
                if (widget.workout.exercises.length > 2)
                  Container(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerLowest,
                    padding: EdgeInsets.only(bottom: 16),
                    child: Row(
                      spacing: 16,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(!_isExpanded ? 'Ver mais' : 'Ver menos')],
                    ),
                  ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
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
                        color: Theme.of(context).colorScheme.secondary,
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
