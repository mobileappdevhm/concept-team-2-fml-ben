import 'package:flutter/material.dart';
import './ClassInfo.dart';


class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Map"),
      ),
      body: new Container(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onFloatingActionButtonPressed,
        tooltip: 'Add',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _onFloatingActionButtonPressed() {
    Navigator.pushNamed(this.context, ClassInfo.routeName);
  }
}