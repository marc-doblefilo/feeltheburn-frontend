import 'package:feeltheburn/models/exercise.dart';

class Serie{
  Exercise exercise;
  int reps;
  int series;

  Serie(Exercise exercise, int reps, int series) {
    this.exercise = exercise;
    this.reps = reps;
    this.series = series;
  }
}