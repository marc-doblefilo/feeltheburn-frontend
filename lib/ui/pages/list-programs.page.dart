import 'package:feeltheburn/ui/widget/app-bar.widget.dart';
import 'package:feeltheburn/ui/widget/main-drawer.widget.dart';
import 'package:flutter/material.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feeltheburn/ui/widget/program-box.widget.dart';

class ListProgramsPage extends StatefulWidget {
  @override
  _ListProgramsPageState createState() => _ListProgramsPageState();
}

class _ListProgramsPageState extends State<ListProgramsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mainDrawer(context, 3),
      appBar: customAppBar('Programs'),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
          child: Container(
            color: BackgroundColor,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('programs').snapshots(),
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
                          return programContainer(context, snapshot.data.docs[index]);
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

