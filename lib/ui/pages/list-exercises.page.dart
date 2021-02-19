import 'package:feeltheburn/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feeltheburn/ui/widget/exercise-box.widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ListExercisesScreen extends StatefulWidget {
  ListExercisesScreen({Key key}) : super(key: key);

  @override
  _ListExercisesScreenState createState() => _ListExercisesScreenState();
}

class _ListExercisesScreenState extends State<ListExercisesScreen> {
  String query = "";
  final _textFieldController = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Search..."),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('RESET'),
                onPressed: () {
                  setState(() {
                    query = "";
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exercises',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: HeaderColor,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _displayTextInputDialog(context);
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
          child: Container(
            color: BackgroundColor,
            child: StreamBuilder(
                stream: query == ""
                  ? FirebaseFirestore.instance.collection('exercises').snapshots()
                  : FirebaseFirestore.instance.collection('exercises').orderBy('name')
                .startAt([query]).endAt([query + '\uf8ff']).snapshots(),
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

// FirebaseFirestore.instance.collection('exercises').snapshots(),
// FirebaseFirestore.instance.collection('exercises').orderBy('name').startAt([searchString]).endAt([searchString + '\uf8ff']).snapshots(),