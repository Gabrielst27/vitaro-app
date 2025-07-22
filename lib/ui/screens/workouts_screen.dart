import 'package:flutter/material.dart';
import 'package:vitaro_app/ui/widgets/workout_list.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  String _sportFilter = 'Todos os esportes';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownMenu(
                      initialSelection: _sportFilter,
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                          value: 'Todos os esportes',
                          label: 'Todos os esportes',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              WorkoutList(),
            ],
          ),
        );
      },
    );
  }
}
