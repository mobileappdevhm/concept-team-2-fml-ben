import 'package:flutter/material.dart';
import 'globals.dart' as globals;


class MyClasses extends StatefulWidget {
  MyClasses({Key key}) : super(key: key);


  @override
  _MyClassesState createState() => new _MyClassesState();
}

class _MyClassesState extends State<MyClasses>{
  int _localCount = globals.count;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Count"),
            new SizedBox(
              width: 40.0,
              child: new Container(
                child: new Text('$_localCount'),
              ),
            ),
          ],
        ),
      ),
    );

  }
}