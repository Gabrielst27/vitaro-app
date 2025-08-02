import 'package:flutter/material.dart';
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
        margin: EdgeInsets.all(16),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: EdgeInsets.all(24),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
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
                    IconButton(
                      onPressed: _editWorkout,
                      icon: Icon(
                        Icons.edit,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                if (widget.workout.exercises.isNotEmpty)
                  for (
                    int i = 0;
                    i < widget.workout.exercises.length && i <= 2;
                    i++
                  )
                    Text(
                      '${widget.workout.exercises[i].series!.length}x ${widget.workout.exercises[i].name}',
                    ),
                if (widget.workout.exercises.length > 3 && !_isExpanded)
                  const Text('...'),
                if (_isExpanded)
                  for (int i = 3; i < widget.workout.exercises.length; i++)
                    Text(
                      '${widget.workout.exercises[i].series!.length}x ${widget.workout.exercises[i].name}',
                    ),
                const SizedBox(height: 24),
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
          ),
        ),
      ),
    );
  }
}
