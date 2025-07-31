import 'package:vitaro_app/data/api/dtos/edit_serie_dto.dart';
import 'package:vitaro_app/data/api/dtos/serie_dto.dart';
import 'package:vitaro_app/data/static/exercises.dart';
import 'package:vitaro_app/domain/models/exercise_model.dart';

class EditExerciseDto {
  final String id;
  final String refId;
  List<SerieDto> series;

  EditExerciseDto({
    required this.id,
    required this.refId,
    required this.series,
  });
}

class EditExcerciseMapper {
  static Map<String, dynamic> toDto(ExerciseModel exercise) {
    final series = [
      ...exercise.series!.map(
        (serie) => EditSerieMapper.toDto(serie),
      ),
    ];
    return {
      'id': exercise.id,
      'refId': staticExercises.firstWhere((e) => e.name == exercise.name).id,
      'series': series,
    };
  }
}
