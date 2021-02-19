import 'package:feeltheburn/ui/widget/main-drawer.widget.dart';
import 'package:feeltheburn/ui/widget/multi-select-chip.widget.dart';
import 'package:flutter/material.dart';
import 'package:feeltheburn/ui/widget/app-bar.widget.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:feeltheburn/services/exercise.services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
            backgroundColor: BackgroundColor,
            title: Text("Select Muscular Groups",
            style: TextStyle(
              color: TextColor,
            ),),
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
      icon: Icon(Icons.arrow_drop_down_rounded),
      iconEnabledColor: Colors.white,
      underline: Container(
        height: 2,
        color: UnderlineButtonColor,
      ),
      dropdownColor: Color.fromRGBO(39, 39, 39, 0.9),
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
      drawer: mainDrawer(context, 2),
      appBar: customAppBar("Create an Exercise"),
      body: Center(
        child: Container(
          color: BackgroundColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 40.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Name for the new exercise: ',
                    style: TextStyle(
                      color: TextColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5.0),
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
                          print("[Ex] Working");
                          Map <String,dynamic> data = {"name":_nameController.text,"muscularGroups":selectedMuscularGroups,"difficulty":selectedDifficulty,"description":_descriptionController.text};
                          FirebaseFirestore.instance.collection("exercises").add(data);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                elevation: 16,
                                child: Container(
                                  height: 100.0,
                                  width: 50.0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                    Text(_nameController.text + ' was saved in DB!',
                                    ),
                                    ],
                                ),
                                ),
                              );
                            },
                          );
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
