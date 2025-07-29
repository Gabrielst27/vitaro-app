class SerieDto {
  final String id;
  final String accessory;
  final int position;
  final int reps;
  final int restInSeconds;
  final String technique;
  final double weight;

  SerieDto({
    required this.id,
    required this.accessory,
    required this.position,
    required this.reps,
    required this.restInSeconds,
    required this.technique,
    required this.weight,
  });
}

class SerieMapper {
  static SerieDto toDto(Map<String, dynamic> data) {
    return SerieDto(
      id: data['id'],
      accessory: data['accessory'] ?? '',
      position: data['position'] is int
          ? data['position']
          : int.parse(data['position']),
      reps: data['reps'] is int ? data['reps'] : int.parse(data['reps']),
      restInSeconds: data['restInSeconds'] is int
          ? data['restInSeconds']
          : int.parse(data['restInSeconds']),
      technique: data['technique'] ?? '',
      weight: data['weight'] is double
          ? data['weight']
          : data['weight'] is int
          ? (data['weight'] as int).toDouble()
          : double.parse(data['weight']),
    );
  }
}
