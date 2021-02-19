import 'package:feeltheburn/ui/widget/app-bar.widget.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feeltheburn/ui/widget/exercise-box.widget.dart';
import 'package:feeltheburn/services/exercise.services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ListExercisesScreen extends StatefulWidget {
  ListExercisesScreen({Key key}) : super(key: key);

  @override
  _ListExercisesScreenState createState() => _ListExercisesScreenState();
}

class _ListExercisesScreenState extends State<ListExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Exercises"),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
          child: Container(
            color: BackgroundColor,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('exercises').snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Center(
                        child: Text("Not Working"),
                      );
                    case ConnectionState.waiting:
                      return Center(
                        child: Text("Waiting"),
                      );
                    default:
                      return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return exerciseContainer(context, snapshot.data.docs[index]);
                        },
                      );
                  }
                }),
          ),
        ),
      ),
    );
  }
}
