class Exercise{
  String name;
  List<String> muscularGroup;
  String difficulty;
  String description;

  Exercise({
    this.name,
    this.muscularGroup,
    this.difficulty,
    this.description
  });

  factory Exercise.fromJson(Map<String, dynamic> parsedJson){
    return Exercise(
        name: parsedJson['name'],
        muscularGroup: parsedJson['muscularGroup'].cast<String>(),
        difficulty: parsedJson ['difficulty'],
        description: parsedJson ['description']
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic> {
      "name": name,
      "muscularGroup": muscularGroup,
      "difficulty": difficulty,
      "description": description,
    };
  }

  factory Exercise.loadExercise(String newName, List<String> newMuscularGroups, String newDifficulty, String newDescription) {
    return Exercise(
    name: newName,
    muscularGroup: newMuscularGroups,
    difficulty: newDifficulty,
    description: newDescription
    );
  }
}