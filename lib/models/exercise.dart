class Exercise {
  String name;
  List<dynamic> muscularGroup;
  String difficulty;
  String description;

  Exercise(this.name, this.muscularGroup, this.difficulty,
      this.description);


  factory Exercise.setExercise(int newIndex, String newName, List<dynamic> newMuscularGroup,
      String newDifficulty, String newDescription) {
    return Exercise(newName, newMuscularGroup, newDifficulty, newDescription);
  }
}
