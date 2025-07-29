class SeriesModel {
  final String id;
  final int position;
  final double weight;
  final int reps;
  final int restInSeconds;
  final String technique;
  final String accessory;

  SeriesModel({
    required this.id,
    required this.position,
    required this.weight,
    required this.reps,
    required this.restInSeconds,
    required this.technique,
    required this.accessory,
  });
}
