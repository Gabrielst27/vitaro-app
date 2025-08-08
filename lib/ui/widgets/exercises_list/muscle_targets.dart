import 'package:flutter/material.dart';
import 'package:vitaro_app/domain/enums/muscular_groups_enum.dart';
import 'package:vitaro_app/domain/models/exercise_model.dart';

class MuscleTargets extends SliverPersistentHeaderDelegate {
  final List<ExerciseModel> exercises;

  const MuscleTargets({required this.exercises});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final Set<EMuscularGroups> muscularGroups = {};
    for (final exercise in exercises) {
      muscularGroups.add(exercise.muscularGroup);
    }
    final double visible = 1 - (shrinkOffset / maxExtent).clamp(0, 1);
    return Opacity(
      opacity: visible,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.only(top: 8),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: muscularGroups
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ClipOval(
                        child: Image.asset(
                          e.imagePath,
                          scale: 3.5,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant MuscleTargets oldDelegate) {
    return oldDelegate.exercises != exercises;
  }
}
