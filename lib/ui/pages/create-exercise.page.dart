import 'package:feeltheburn/ui/widget/multi-select-chip.widget.dart';
import 'package:flutter/material.dart';
import 'package:feeltheburn/ui/widget/app-bar.widget.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:feeltheburn/database.dart';

class CreateExerciseScreen extends StatefulWidget {
  final Database db;

  CreateExerciseScreen(this.db);

  @override
  _CreateExerciseScreenState createState() => _CreateExerciseScreenState();
}

class _CreateExerciseScreenState extends State<CreateExerciseScreen> {
  final List<String> muscularGroups = [
    "Full Body",
    "Triceps",
    "Chest",
    "Legs",
    "Buttocks",
    "Calfs",
    "Femoral",
    "Quadriceps",
    "Biceps",
    "Forearms",
    "Lats",
    "Shoulders",
    "Trapezius",
    "Core",
    "Lumbar",
    "Obliques"
  ];
  String difficulty = "Easy";

  _showReportDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //Here we will build the content of the dialog
          return AlertDialog(
            title: Text("Select Muscular Groups"),
            content: MultiSelectChip(muscularGroups),
            actions: <Widget>[
              FlatButton(
                child: Text("Select"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  final nameField = TextField(
    obscureText: false,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      hintText: "Name for the exercise",
      hintStyle: TextStyle(
        fontSize: 16.0,
        color: TextColor,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: white),
        borderRadius: BorderRadius.circular(8.0),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    style: TextStyle(
      fontSize: 16.0,
      color: TextColor,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final muscularGroupsField = RaisedButton(
      child: Text(
        "Select Muscular Groups",
        style: TextStyle(
          fontSize: 16.0,
          color: TextColor,
        ),
      ),
      color: ButtonBackgroundColor,
      onPressed: () => _showReportDialog(),
    );

    final levelField = DropdownButton(
      value: difficulty,
      style: TextStyle(
        color: TextColor,
        fontSize: 14.0,
      ),
      icon: Icon(Icons.arrow_downward),
      iconEnabledColor: SelectedButtonBackgroundColor,
      underline: Container(
        height: 2,
        color: UnderlineButtonColor,
      ),
      dropdownColor: ButtonBackgroundColor,
      onChanged: (String newValue) {
        setState(() {
          difficulty = newValue;
        });
      },
      items: <String>['Easy', 'Medium', 'Hard'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

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
                SizedBox(height: 10.0),
                levelField,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
