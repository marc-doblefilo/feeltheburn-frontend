import 'package:feeltheburn/models/serie.dart';

class Program {
  String name;
  List<Serie> exercises;
  int difficulty;
  List<String> muscularGroup;

  Program(String name, List<Serie> exercises, int difficulty, int time, List<String> muscularGroup) {
    this.name = name;
    this.exercises = exercises;
    this.difficulty = difficulty;
    this.muscularGroup = muscularGroup;
  }
}