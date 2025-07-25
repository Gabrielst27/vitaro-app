class SeriesModel {
  final double weight;
  final int reps;
  final int? restInSeconds;
  final String? technique;
  final String? accessory;

  SeriesModel({
    required this.weight,
    required this.reps,
    this.restInSeconds,
    this.technique,
    this.accessory,
  });
}
