import 'package:feeltheburn/models/serie.dart';

class Program {
  String name;
  List<Serie> exercises;
  String difficulty;
  List<String> muscleGroups;
  String category;
  int time;

  Program(String name, List<Serie> exercises, String difficulty, int time, List<String> muscleGroups, String category, int time) {
    this.name = name;
    this.exercises = exercises;
    this.difficulty = difficulty;
    this.muscleGroups = muscleGroups;
    this.category = category;
    this.time = time;
  }
}