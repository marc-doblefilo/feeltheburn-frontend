import 'package:feeltheburn/models/serie.dart';

class Program {
  String name;
  List<Serie> exercises;
  int difficulty;
  int time;

  Program(String name, List<Serie> exercises, int difficulty, int time) {
    this.name = name;
    this.exercises = exercises;
    this.difficulty = difficulty;
    this.time = time;
  }
}