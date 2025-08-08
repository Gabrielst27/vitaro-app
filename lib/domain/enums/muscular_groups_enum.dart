enum EMuscularGroups {
  chest,
  trapezius,
  dorsi,
  biceps,
  triceps,
  forearm,
  deltoid,
  abdomen,
  glute,
  quadriceps,
  hamstrings,
  calf,
}

extension EMuscularGroupsExtension on EMuscularGroups {
  String get imagePath {
    switch (this) {
      case EMuscularGroups.chest:
        return 'assets/images/Chest.webp';
      case EMuscularGroups.trapezius:
        return 'assets/images/Trapezius.webp';
      case EMuscularGroups.dorsi:
        return 'assets/images/Dorsi.png';
      case EMuscularGroups.biceps:
        return 'assets/images/Biceps.webp';
      case EMuscularGroups.triceps:
        return 'assets/images/Triceps.webp';
      case EMuscularGroups.forearm:
        return 'assets/images/Forearm.png';
      case EMuscularGroups.deltoid:
        return 'assets/images/Deltoid.webp';
      case EMuscularGroups.abdomen:
        return 'assets/images/Abdomen.webp';
      case EMuscularGroups.glute:
        return 'assets/images/Glute.webp';
      case EMuscularGroups.quadriceps:
        return 'assets/images/Quadriceps.webp';
      case EMuscularGroups.hamstrings:
        return 'assets/images/Hamstrings.webp';
      case EMuscularGroups.calf:
        return 'assets/images/Calf.webp';
    }
  }
}
