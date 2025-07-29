import 'package:vitaro_app/data/api/dtos/exercise_dto.dart';
import 'package:vitaro_app/domain/enums/sports_enum.dart';
import 'package:vitaro_app/domain/enums/workout_goals_enum.dart';

class WorkoutsDto {
  final String id;
  final String title;
  final EWorkoutGoals goal;
  final ESports sport;
  final String authorId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<dynamic> exercisesResponse;
  List<ExerciseDto>? exercisesDto;

  WorkoutsDto({
    required this.id,
    required this.title,
    required this.goal,
    required this.sport,
    required this.authorId,
    required this.createdAt,
    required this.updatedAt,
    required this.exercisesResponse,
    this.exercisesDto,
  });
}

class WorkoutsMapper {
  static WorkoutsDto toDto(Map<String, dynamic> data) {
    return WorkoutsDto(
      id: data['id'],
      title: data['title'],
      goal: goalToEnum(data['goal']),
      sport: sportToEnum(data['sport']),
      authorId: data['authorId'],
      createdAt: toDate(data['createdAt']),
      updatedAt: toDate(data['updatedAt']),
      exercisesResponse: data['exercises'],
    );
  }

  static goalToEnum(String value) {
    switch (value) {
      case 'weightLoss':
        return EWorkoutGoals.weightLoss;
      case 'hypertrophy':
        return EWorkoutGoals.hypertrophy;
      case 'strength':
        return EWorkoutGoals.strength;
      case 'endurance':
        return EWorkoutGoals.endurance;
      default:
        throw Exception('$value não existe em EWorkoutGoals');
    }
  }

  static sportToEnum(String value) {
    switch (value) {
      case 'bodybuilding':
        return ESports.bodybuilding;
      case 'powerlifting':
        return ESports.powerlifting;
      case 'crossfit':
        return ESports.crossfit;
      case 'functional':
        return ESports.functional;
      case 'calisthenics':
        return ESports.calisthenics;
      default:
        throw Exception('$value não existe em ESports');
    }
  }

  static toDate(String value) {
    return DateTime.parse(value);
  }
}
