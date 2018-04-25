import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {

  final TextStyle _style = new TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20.0
  );

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text('Campus Lothstraße: ', style: _style,),
          new Image.asset('assets/campusLoth.png'),
          new Divider(),
          new Text('Campus Pasing: ', style: _style,),
          new Image.asset('assets/campusPasing.png'),
          new Divider(),
          new Text('Campus Karlstraße: ', style: _style,),
          new Image.asset('assets/campusKarl.png'),
        ],
      ),
    );
  }

}
