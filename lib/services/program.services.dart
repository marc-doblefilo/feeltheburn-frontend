import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feeltheburn/models/serie.dart';
import 'package:feeltheburn/models/exercise.dart';

Future<Serie> loadSet(String UID) async {
  DocumentSnapshot document;
  int reps;
  int sets;
  String exercise;

  await FirebaseFirestore.instance
  .collection('series').doc(UID)
  .get().then((value) {
    document = value;
  });

  reps = document['reps'];
  sets = document['sets'];

  exercise = await loadExercise(document['exercise']);

  Serie returnSet = new Serie(exercise, reps, sets);

  return returnSet;
}

Future loadExercise(String UID) async {
  DocumentSnapshot document;

  await FirebaseFirestore.instance
      .collection('exercises').doc(UID)
      .get().then((value) {
    document = value;
  });

  return document['name'];
}