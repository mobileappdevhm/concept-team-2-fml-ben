import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Icon(Icons.map),
      ),
    );
  }
}