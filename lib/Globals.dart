library my_prj.globals;
import 'package:flutter/material.dart';

class Class {
  bool isExpanded;
  final String header;
  final Widget body;
  Class(this.isExpanded, this.header, this.body);
}

int count = 0;

List<Class> getMyClasses(){
  List<Class> ClassList = <Class>[];
  for(int i = 0; i < 5; i++) {
    ClassList.add(
      new Class(
        false,
        "header",
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
