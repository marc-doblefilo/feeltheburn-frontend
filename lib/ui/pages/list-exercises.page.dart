import 'package:feeltheburn/ui/widget/app-bar.widget.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feeltheburn/ui/widget/exercise-box.widget.dart';
import 'package:feeltheburn/services/exercise.services.dart';

class ListExercisesScreen extends StatefulWidget {
  ListExercisesScreen({Key key}) : super(key: key);

  @override
  _ListExercisesScreenState createState() => _ListExercisesScreenState();
}

class _ListExercisesScreenState extends State<ListExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar("Exercises"),
      body: Center(
        child: Container(
          color: BackgroundColor,
          child: FutureBuilder(
              future: loadExercises(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Center(child: Text("Not Working"),);
                  case ConnectionState.waiting:
                    return Center(child: Text("Waiting"),);
                  default:
                    return Center(child: Text(snapshot.data[0].name),);
                }
              }
          ),
        ),
      ),
    );
  }
}
