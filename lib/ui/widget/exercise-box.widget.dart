import 'package:flutter/material.dart';
import 'package:feeltheburn/util/colors.dart';
import 'package:feeltheburn/models/exercise.dart';

Widget exerciseContainer(Exercise exercise){

  var concatenate = StringBuffer();
  exercise.muscularGroup.forEach((item){
    concatenate.write("|$item| ");
  });
  String muscularGroupsString = concatenate.toString();

  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 10.0),
    decoration: BoxDecoration(
      color: (exercise.difficulty == "Easy") ? EasyBoxColor : (exercise.difficulty == "Medium") ? MediumBoxColor : Colors.black,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child:Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exercise.name,
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
            muscularGroupsString,
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
            exercise.description,
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