import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:feeltheburn/models/exercise.dart';

Future<String> _loadExerciseDatabase() async {
  return await rootBundle.loadString('assets/database.json');
}

Future loadExercise() async {
  String jsonString = await _loadExerciseDatabase();
  final jsonResponse = json.decode(jsonString);
  Exercise exercise = new Exercise.fromJson(jsonResponse);
  print(exercise.name);
}

Future uploadExercise(String name, List<String> muscularGroups, String difficulty, String description) async {
  Exercise exercise = Exercise.loadExercise(name, muscularGroups, difficulty, description);
  print(loadExercise());
}