import 'package:flutter/material.dart';
import 'package:feeltheburn/ui/widget/app-bar.widget.dart';

class CreateExerciseScreen extends StatefulWidget {
  @override
  _CreateExerciseScreenState createState() => _CreateExerciseScreenState();
}

class _CreateExerciseScreenState extends State<CreateExerciseScreen> {
  final nameField = TextField(
    obscureText: false,
    decoration: InputDecoration(
      hintText: "Name for the exercise",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar("Create an Exercise"),
      body: Text("Hello"),
    );
  }
}
