import 'package:flutter/material.dart';
import 'package:vitaro_app/domain/models/workouts_model.dart';
import 'package:vitaro_app/ui/widgets/edit_workout_form.dart';

class EditWorkoutHeader extends SliverPersistentHeaderDelegate {
  final WorkoutModel workout;

  EditWorkoutHeader({required this.workout});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double visible = 1 - (shrinkOffset / maxExtent).clamp(0, 1);
    return Opacity(
      opacity: visible,
      child: Container(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        child: EditWorkoutForm(
          workout: workout,
        ),
      ),
    );
  }

  @override
  double get maxExtent => 180;

  @override
  double get minExtent => maxExtent;

  @override
  bool shouldRebuild(covariant EditWorkoutHeader oldDelegate) {
    return oldDelegate.workout != workout;
  }
}
