import 'package:flutter/widgets.dart';
import 'package:vitaro_app/domain/models/workouts_model.dart';
import 'package:vitaro_app/ui/widgets/workout_item.dart';

class WorkoutList extends StatelessWidget {
  final List<WorkoutModel> workouts;

  const WorkoutList({super.key, required this.workouts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) => WorkoutItem(
          workout: workouts[index],
        ),
      ),
    );
  }
}
