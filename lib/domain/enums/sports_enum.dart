enum ESports {
  bodybuilding,
  powerlifting,
  crossfit,
  functional,
  calisthenics,
}

String sportLabel(ESports value) {
  switch (value) {
    case ESports.bodybuilding:
      return 'Musculação';
    case ESports.powerlifting:
      return 'Powerlifting';
    case ESports.calisthenics:
      return 'Calistenia';
    case ESports.crossfit:
      return 'Crossfit';
    case ESports.functional:
      return 'Funcional';
  }
}
