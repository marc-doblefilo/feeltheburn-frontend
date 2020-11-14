import 'package:flutter/material.dart';
import 'package:feeltheburn/ui/widget/app-bar.widget.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:feeltheburn/ui/widget/muscular-group-dialog.widget.dart';

class CreateExerciseScreen extends StatefulWidget {
  @override
  _CreateExerciseScreenState createState() => _CreateExerciseScreenState();
}

class _CreateExerciseScreenState extends State<CreateExerciseScreen> {
  final nameField = TextField(
    obscureText: false,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      hintText: "Name for the exercise",
      hintStyle: TextStyle(
        fontSize: 14.0,
        color: TextColor,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: white),
        borderRadius: BorderRadius.circular(8.0),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  );

  final muscularGroupsField = ListTile(
    title: Text(
      "Select Muscular Groups",
      style: TextStyle(
        fontSize: 14.0,
        color: TextColor,
      ),
    ),
    onTap: () {},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar("Create an Exercise"),
      body: Center(
        child: Container(
          color: BackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 45.0),
                nameField,
                SizedBox(height: 10.0),
                muscularGroupsField,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
