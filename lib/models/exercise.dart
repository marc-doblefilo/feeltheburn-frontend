class Exercise {
  int index;
  String name;
  List<dynamic> muscularGroup;
  String difficulty;
  String description;

  Exercise(this.index, this.name, this.muscularGroup, this.difficulty,
      this.description);

  factory Exercise.fromJson(dynamic json) {
    return Exercise(
      json['index'] as int,
      json['name'] as String,
      json['muscularGroup'] as List<dynamic>,
      json['difficulty'] as String,
      json['description'] as String,
    );
  }

  factory Exercise.setExercise(int newIndex, String newName, List<dynamic> newMuscularGroup,
      String newDifficulty, String newDescription) {
    return Exercise(newIndex, newName, newMuscularGroup, newDifficulty, newDescription);
  }
}
