class Exercise {
  final int id;
  final String exerciseName;
  final String exerciseUrl;
  final int noOfMinuites;
  bool completed;

  Exercise({
    required this.id,
    required this.exerciseName,
    required this.exerciseUrl,
    required this.noOfMinuites,
    required this.completed,
  });
}
