import 'package:feeltheburn/ui/widget/app-bar.widget.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:feeltheburn/ui/widget/exercise-box.widget.dart';
import 'package:feeltheburn/services/exercise.services.dart';

class ListExercisesScreen extends StatefulWidget {
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
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(child: Text("Loading...")),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data[index].name),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
