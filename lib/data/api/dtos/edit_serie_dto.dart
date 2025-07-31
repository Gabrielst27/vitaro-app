import 'package:vitaro_app/domain/models/series_model.dart';

class EditSerieDto {
  final String id;
  final String accessory;
  final int position;
  final int reps;
  final int restInSeconds;
  final String technique;
  final double weight;

  EditSerieDto({
    required this.id,
    required this.accessory,
    required this.position,
    required this.reps,
    required this.restInSeconds,
    required this.technique,
    required this.weight,
  });
}

class EditSerieMapper {
  static Map<String, dynamic> toDto(SeriesModel serie) {
    return {
      'id': serie.id,
      'accessory': serie.accessory,
      'position': serie.position,
      'reps': serie.reps,
      'restInSeconds': serie.restInSeconds,
      'technique': serie.technique,
      'weight': serie.weight,
    };
  }
}
