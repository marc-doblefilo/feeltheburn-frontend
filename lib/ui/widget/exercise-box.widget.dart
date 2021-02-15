import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:feeltheburn/models/exercise.dart';

Widget exerciseContainer(BuildContext context, DocumentSnapshot document){
    return Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 10.0),
    decoration: BoxDecoration(
      color: (document['difficulty'] == "Easy") ? EasyBoxColor : (document['difficulty'] == "Medium") ? MediumBoxColor : HardBoxColor,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child:Padding(
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
          Text(
            document['muscularGroup'].join(","),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            document['description'],
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 4.0,
          ),
        ],
      ),
    ),
  );
}