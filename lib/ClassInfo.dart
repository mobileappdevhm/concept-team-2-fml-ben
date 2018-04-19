import 'package:flutter/material.dart';

class ClassInfo extends StatefulWidget {
  ClassInfo({Key key}) : super(key: key);

  static const String routeName = "/ClassInfo";


  @override
  _ClassInfoState createState() => new _ClassInfoState();
}

/// // 1. After the page has been created, register it with the app routes
/// routes: <String, WidgetBuilder>{
///   ClassInfo.routeName: (BuildContext context) => new ClassInfo(title: "ClassInfo"),
/// },
///
/// // 2. Then this could be used to navigate to the page.
/// Navigator.pushNamed(context, ClassInfo.routeName);
///

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