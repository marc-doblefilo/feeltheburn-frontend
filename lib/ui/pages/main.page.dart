import 'package:feeltheburn/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feeltheburn/ui/widget/settings-drawer.widget.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:feeltheburn/ui/widget/main-drawer.widget.dart';
import 'package:firebase_core/firebase_core.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: mainDrawer(context, 0),
        endDrawer: settingsDrawer(context),
        body: NestedScrollView(

            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return<Widget>[
                SliverAppBar(
                  expandedHeight: 300.0,
                  collapsedHeight: 101.0,
                  pinned: true,
                  floating: true,
                  title: Image.asset('assets/B-logo-orng-nobg.png',
                    width: 300,
                    height: 150,
                  ),
                  centerTitle: true,
                  backgroundColor: HeaderColor,
                  toolbarHeight: 100.0,
                  bottom: PreferredSize(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24.0, left: 12.0, right: 12.0),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 24.0),
                          hintText: "Search for a training program...",
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    preferredSize: Size.fromHeight(100.0),
                  ),
                  actions: <Widget>[
                    Builder(
                      builder: (context){
                        return IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        );
                      },
                    )
                  ],
                ),
              ];
            },
            body: SingleChildScrollView(
                child: Padding(
                    padding:
                    const EdgeInsets.only(top: 20.0, right: 5.0, left: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text("Top Trends", style: TextStyle(
                            color: TextColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w800,
                          ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    )
                )
            )
        )
    );
  }
}
