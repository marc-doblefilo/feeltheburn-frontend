import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:feeltheburn/models/exercise.dart';
import 'package:path_provider/path_provider.dart';

Future<String> _loadExerciseDatabase() async {
  return await rootBundle.loadString('assets/database.json');
}

Future loadExercise() async {
  String data = await _loadExerciseDatabase();
  final jsonData = json.decode(data)['exercises'] as List;
  List<Exercise> exercises = jsonData.map((tagJson) => Exercise.fromJson(tagJson)).toList();
  print(exercises[0].name);
}

