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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.filter_list_rounded,
                    size: 28,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SearchBar(
                      hintText: 'Pesquisar',
                      leading: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
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
      ),
    );
  }
}
