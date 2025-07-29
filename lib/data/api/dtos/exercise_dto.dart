import 'package:vitaro_app/data/api/dtos/serie_dto.dart';

class ExerciseDto {
  final String id;
  final String name;
  final String refId;
  final List<dynamic> seriesResponse;
  List<SerieDto>? seriesDto;

  ExerciseDto({
    required this.id,
    required this.name,
    required this.refId,
    required this.seriesResponse,
  });
}

class ExcerciseMapper {
  static toDto(Map<String, dynamic> data) {
    return ExerciseDto(
      id: data['id'],
      name: data['name'],
      refId: data['refId'],
      seriesResponse: data['series'],
    );
  }
}
