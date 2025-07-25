import 'package:firebase_auth/firebase_auth.dart';
import 'package:vitaro_app/data/api/workout_api_service.dart';
import 'package:vitaro_app/domain/models/result_dto.dart';

final _workoutApiService = WorkoutApiService();

class FindCurrentUserWorkoutsUsecase {
  static Future<Result<void>> execute() async {
    final auth = FirebaseAuth.instance;
    final id = auth.currentUser!.uid;
    final result = await _workoutApiService.findUserWorkouts(id);
    if (!result.isSuccess) {
      return Result.failure(result.errorMessage);
    }
    return Result.successEmpty();
  }
}
