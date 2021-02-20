import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:feeltheburn/models/exercise.dart';

Widget programContainer(BuildContext context, DocumentSnapshot document) {
  _imageSelection(String category) {
    switch(category) {
      case 'Hypertrophy':
        return AssetImage('assets/program/hypertrophy.jpg');
        break;
      default:
        return null;
    }
  }

  return InkWell(
    onTap: () {
      print("Container tapped.");
      return null;
    },
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: (document['difficulty'] == "Easy")
            ? EasyBoxColor
            : (document['difficulty'] == "Medium")
                ? MediumBoxColor
                : HardBoxColor,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: _imageSelection(document['category']),
          fit: BoxFit.fitWidth,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              document['name'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    document['muscleGroups'].join(", "),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    (document['time']),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    ),
  );
}
