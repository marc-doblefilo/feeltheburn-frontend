import 'package:feeltheburn/models/exercise.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Serie{
  String exercise;
  int reps;
  int series;

  Serie(String exercise, int reps, int series) {
    this.exercise = exercise;
    this.reps = reps;
    this.series = series;
  }
}