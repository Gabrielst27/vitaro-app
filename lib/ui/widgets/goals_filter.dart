import 'package:flutter/material.dart';

enum EGoalFilter {
  all,
  weightLoss,
  hypertrophy,
  strength,
}

class GoalsFilter extends StatefulWidget {
  const GoalsFilter({super.key});

  @override
  State<GoalsFilter> createState() => _GoalsFilterState();
}

class _GoalsFilterState extends State<GoalsFilter> {
  EGoalFilter _currentGoalFilter = EGoalFilter.all;

  String _goalFilterLabel(EGoalFilter filter) {
    switch (filter) {
      case EGoalFilter.all:
        return 'Todos';
      case EGoalFilter.weightLoss:
        return 'Emagrecimento';
      case EGoalFilter.hypertrophy:
        return 'Hipertrofia';
      case EGoalFilter.strength:
        return 'Força';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<EGoalFilter>(
      value: _currentGoalFilter,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.bold,
      ),
      icon: Icon(Icons.arrow_drop_down_rounded),
      dropdownColor: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(12),
      isExpanded: true,
      items: EGoalFilter.values.map((filter) {
        return DropdownMenuItem(
          value: filter,
          child: Text(_goalFilterLabel(filter)),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _currentGoalFilter = value;
          });
        }
      },
    );
  }
}
