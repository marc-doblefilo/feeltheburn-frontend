import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:feeltheburn/models/exercise.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> _loadExerciseDatabase() async {
  return await rootBundle.loadString('assets/database.json');
}

Future<List<Exercise>> loadExercises() async {
  String data = await _loadExerciseDatabase();
  final jsonData = jsonDecode(data)['exercises'] as List;
  List<Exercise> exercises = jsonData.map((tagJson) => Exercise.fromJson(tagJson)).toList();
  print("[DB] Loaded succesfully");
  return exercises;
}