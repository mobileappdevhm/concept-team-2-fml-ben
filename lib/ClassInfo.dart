import 'package:flutter/material.dart';

class ClassInfo extends StatefulWidget {
  ClassInfo({Key key}) : super(key: key);

  static const String routeName = "/ClassInfo";

  @override
  _ClassInfoState createState() => new _ClassInfoState();
}

class _ClassInfoState extends State<ClassInfo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        title: new Text("More Info"),
      ),
      body: new Container(
        child: new Text("More Info Goes Here!"),
      ),
    );
  }
}