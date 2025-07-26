import 'package:vitaro_app/domain/enums/muscular_groups_enum.dart';
import 'package:vitaro_app/domain/models/series_model.dart';

class ExerciseModel {
  final String id;
  final String name;
  final EMuscularGroups muscularGroup;
  final List<SeriesModel>? series;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.muscularGroup,
    this.series,
  });
}
