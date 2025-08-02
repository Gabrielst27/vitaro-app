enum EWorkoutGoals {
  weightLoss,
  hypertrophy,
  strength,
}

String goalLabel(EWorkoutGoals value) {
  switch (value) {
    case EWorkoutGoals.weightLoss:
      return 'Emagrecimento';
    case EWorkoutGoals.hypertrophy:
      return 'Hipertrofia';
    case EWorkoutGoals.strength:
      return 'Força';
  }
}
