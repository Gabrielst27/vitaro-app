import 'package:flutter/material.dart';

enum ESportFilter {
  all,
  bodybuilding,
  powerlifting,
  calisthenics,
  crossfit,
  functional,
}

class SportsFilter extends StatefulWidget {
  const SportsFilter({super.key});

  @override
  State<SportsFilter> createState() => _SportsFilterState();
}

class _SportsFilterState extends State<SportsFilter> {
  ESportFilter _currentSportFilter = ESportFilter.all;

  String _sportFilterLabel(ESportFilter filter) {
    switch (filter) {
      case ESportFilter.all:
        return 'Todos';
      case ESportFilter.bodybuilding:
        return 'Musculação';
      case ESportFilter.powerlifting:
        return 'Powerlifting';
      case ESportFilter.calisthenics:
        return 'Calistenia';
      case ESportFilter.crossfit:
        return 'Crossfit';
      case ESportFilter.functional:
        return 'Funcional';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ESportFilter>(
      value: _currentSportFilter,
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
      items: ESportFilter.values.map((filter) {
        return DropdownMenuItem(
          value: filter,
          child: Text(_sportFilterLabel(filter)),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _currentSportFilter = value;
          });
        }
      },
    );
  }
}
