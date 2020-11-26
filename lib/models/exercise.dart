class Exercise{
  String name;
  List<String> muscularGroup;
  String difficulty;
  String description;

  Exercise(
    this.name,
    this.muscularGroup,
    this.difficulty,
    this.description
  );

  factory Exercise.fromJson(dynamic json){
    return Exercise(
        json['name'] as String,
        json['muscularGroup'] as List<String>,
        json['difficulty'] as String,
        json['description'] as String,
    );
  }

  factory Exercise.setExercise(String newName, List<String> newMuscularGroup, String newDifficulty, String newDescription) {
    return Exercise(
      newName,
      newMuscularGroup,
      newDifficulty,
      newDescription
    );
  }

}