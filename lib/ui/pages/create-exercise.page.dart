import 'package:feeltheburn/ui/widget/multi-select-chip.widget.dart';
import 'package:flutter/material.dart';
import 'package:feeltheburn/ui/widget/app-bar.widget.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:feeltheburn/services/exercise.services.dart';

class CreateExerciseScreen extends StatefulWidget {
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
  List<String> selectedMuscularGroups = [];

  String selectedDifficulty = "Easy";

  _showReportDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //Here we will build the content of the dialog
          return AlertDialog(
            title: Text("Select Muscular Groups"),
            content: MultiSelectChip(muscularGroups,
                onSelectionChanged: (selectedList) {
              setState(() {
                selectedMuscularGroups = selectedList;
              });
            }),
            actions: <Widget>[
              FlatButton(
                child: Text("Select"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _validateNameEmpty = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nameField = TextField(
      controller: _nameController,
      obscureText: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Enter the Name for the exercise",
        errorText: _validateNameEmpty ? "Exercise MUST have a name" : null,
        labelStyle: TextStyle(
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

    final descriptionField = TextField(
      controller: _descriptionController,
      obscureText: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: "Enter a short description (optional)",
        labelStyle: TextStyle(
          fontSize: 10.0,
          color: TextColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      style: TextStyle(
        fontSize: 10.0,
        color: TextColor,
      ),
    );

    final muscularGroupsField = Column(
      children: <Widget>[
        RaisedButton(
          child: Text(
            "Select Muscular Groups",
            style: TextStyle(
              fontSize: 16.0,
              color: TextColor,
            ),
          ),
          color: ButtonBackgroundColor,
          onPressed: () => _showReportDialog(),
        ),
        Text(
          "Selected: " + selectedMuscularGroups.join(", "),
          style: TextStyle(
            fontSize: 14.0,
            color: TextColor,
          ),
        ),
      ],
    );

    final levelField = DropdownButton(
      value: selectedDifficulty,
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
          selectedDifficulty = newValue;
        });
      },
      items: <String>['Easy', 'Medium', 'Hard']
          .map<DropdownMenuItem<String>>((String value) {
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 45.0),
                  nameField,
                  SizedBox(height: 10.0),
                  muscularGroupsField,
                  SizedBox(height: 10.0),
                  levelField,
                  SizedBox(height: 10.0),
                  descriptionField,
                  SizedBox(height: 10.0),
                  RaisedButton(
                    child: Text("Save"),
                    onPressed: () {
                      setState(() {
                        _nameController.text.isEmpty
                            ? _validateNameEmpty = true
                            : _validateNameEmpty = false;
                        if(_validateNameEmpty != true) {
                          print(_nameController.text);
                          print(selectedDifficulty);
                          print(selectedMuscularGroups.join("; "));
                          print(_descriptionController.text);
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
