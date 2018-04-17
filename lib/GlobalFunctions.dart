import 'package:flutter/material.dart';
import 'globals.dart' as globals;


class Class {
  bool isExpanded;
  final String header;
  final Widget body;

  Class(this.isExpanded, this.header, this.body);
}


List<Class> getMyClasses() {
  List<Class> ClassList = <Class>[];
  //Poll database for information and number of entries.
  for (int i = 0; i < globals.count; i++) {
    ClassList.add(
      new Class(
        false,
        "This is my class xD its nme is super long dont you think",

        new Container(
          padding: new EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 8.0),
          child: new Row(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              new Column(
                  children: <Widget>[
                    new Padding(
                        padding: new EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0)),
                    new Text(
                      'Class Time',
                      style: new TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    new Text(
                      'Class Location',
                      style: new TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ]
              ),
              new Padding(
                  padding: new EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 8.0)),
              new FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: null,
                child: new Text("i",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                  ),
                ),
              ),
              new Padding(
                  padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0)),

            ],
          ),
        ),

      ),
    );
  }
  return ClassList;
}

List<Class> getAvaliableClasses() {
  List<Class> ClassList = <Class>[];
  //Poll database for information and number of entries.
  for (int i = 0; i < globals.count; i++) {
    ClassList.add(
      new Class(
        false,
        "Your New Class?",

        new Container(
          padding: new EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 8.0),
          child: new Row(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              new Column(
                  children: <Widget>[
                    new Padding(
                        padding: new EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0)),
                    new Text(
                      'Class Time',
                      style: new TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    new Text(
                      'Class Location',
                      style: new TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ]
              ),
              new Padding(
                  padding: new EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 8.0)),
              new FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: null,
                child: new Text("i",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                  ),
                ),
              ),
              new Padding(
                  padding: new EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 8.0)),
              new FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: null,
                child: new Text("+",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                  ),
                ),
              ),

              new Padding(
                  padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0)),

            ],
          ),
        ),

      ),
    );
  }
  return ClassList;
}


