import 'package:vitaro_app/domain/enums/muscular_groups_enum.dart';

class ExerciseModel {
  final String id;
  final String name;
  final EMuscularGroups muscularGroup;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.muscularGroup,
  });
}
