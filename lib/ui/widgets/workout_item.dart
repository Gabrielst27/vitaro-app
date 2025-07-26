import 'package:flutter/material.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.calculate),
                Text(
                  'TREINO',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.errorContainer,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text('Supino Reto na Máquina'),
            Text('Supino Reto na Máquina'),
            Text('Supino Reto na Máquina'),
            Text('...'),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle,
                    size: 48,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
