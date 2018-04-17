import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class AvaliableClass extends StatefulWidget {
  AvaliableClass({Key key}) : super(key: key);

  @override
  _AvaliableClassState createState() => new _AvaliableClassState();
}

class _AvaliableClassState extends State<AvaliableClass>{
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: new Text("Plus 1"),
              color: Colors.green,
              onPressed: _incrementCounter,
            ),
            new RaisedButton(
              child: new Text("Reset"),
              color: Colors.green,
              onPressed: _resetCounter,
            ),
          ],
        ),
      ),
    );
  }

  void _incrementCounter() {
    globals.count++;
  }

  void _resetCounter() {
    globals.count=0;
  }
}