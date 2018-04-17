import 'package:flutter/material.dart';

class MapPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        title: new Text("Map"),
      ),
      body: new Center(
            child: new Icon(Icons.map)
      ),
    );
  }
}