import 'package:flutter/material.dart';
import 'package:vitaro_app/domain/models/workouts_model.dart';
import 'package:vitaro_app/ui/widgets/workout_list.dart';

class WorkoutsScreen extends StatefulWidget {
  final List<WorkoutModel> workouts;

  const WorkoutsScreen({super.key, required this.workouts});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.filter_list,
                  size: 24,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              const SizedBox(width: 8),
              Text(
                'Filtros',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
        Expanded(
          child: WorkoutList(
            workouts: widget.workouts,
          ),
        ),
      ],
    );
  }
}
