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
        title: new Text("Class ######"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.fromLTRB(5.0, 50.0, 0.0, 0.0),
                ),
                new Text("Date/Time", style: new TextStyle(fontSize: 25.0,),),
              ],
            ),
            new Row(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 0.0),
                ),
                new Text("Place", style: new TextStyle(fontSize: 25.0,),),
              ],
            ),
            new Row(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.fromLTRB(40.0, 50.0, 0.0, 0.0),
                ),
                new Text(
                  "Info Paragraph", style: new TextStyle(fontSize: 20.0,),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}