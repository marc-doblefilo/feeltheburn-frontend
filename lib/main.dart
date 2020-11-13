import 'package:feeltheburn/programs_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:feeltheburn/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feel The Burn',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: cBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: cTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(

        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return<Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              pinned: true,
              floating: true,
              title: Text(
                "Feel The Burn",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: cHeaderColor,
              toolbarHeight: 100.0,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu),
              ),
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
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding:
              const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Top Trends", style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                listItem(img_Full_Body_Training,  "Full Body Program", 53, 30),
                listItem(img_Yoga_Training,  "Yoga Training", 25, 45),
              ],
            )
          )
        )
      )
    );
  }
}

