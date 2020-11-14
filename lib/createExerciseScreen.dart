import 'package:flutter/material.dart';
import 'package:feeltheburn/util/constants.dart';
import 'package:feeltheburn/database.dart';

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
      appBar: AppBar(
        title: Text("Create an exercise",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: cHeaderColor,
      ),
      body: Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 15.0),

                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}