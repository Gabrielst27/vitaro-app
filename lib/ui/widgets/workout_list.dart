import 'package:flutter/widgets.dart';
import 'package:vitaro_app/ui/widgets/workout_item.dart';

class WorkoutList extends StatelessWidget {
  const WorkoutList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => WorkoutItem(),
    );
  }
}
