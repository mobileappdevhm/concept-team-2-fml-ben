import 'package:flutter/material.dart';
import 'globals.dart' as globals;



class Class {
  bool isExpanded;
  final String header;
  final Widget body;
  Class(this.isExpanded, this.header, this.body);
}

List<Class> getMyClasses(){
  List<Class> ClassList = <Class>[];
  for(int i = 0; i < globals.count; i++) {
    ClassList.add(
      new Class(
        false,
        "This is my class xD its nme is super long dont you think",
        new Padding(
          padding: new EdgeInsets.all(20.0),
          child: new Column(
              children: <Widget>[
                new Text("YOU MADE IT")
              ]
          ),
        ),
      ),
    );
  }
  return ClassList;
}
