import 'package:flutter/material.dart';
import 'package:vitaro_app/ui/widgets/goals_filter.dart';
import 'package:vitaro_app/ui/widgets/sports_filter.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Icon(
              Icons.fitness_center,
              size: 104,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Filtros',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          Divider(),
          const SizedBox(height: 16),
          ListTile(
            leading: Text(
              'Esporte:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            title: SportsFilter(),
          ),
          ListTile(
            leading: Text(
              'Objetivo:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            title: GoalsFilter(),
          ),
        ],
      ),
    );
  }
}
