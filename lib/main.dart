import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/ClassInfo.dart';
import 'package:demo_muas_sliding/SearchClasses.dart';
import 'package:demo_muas_sliding/pages/homePage.dart';
import 'package:demo_muas_sliding/model/department.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'demo_muas_sliding',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: <String, WidgetBuilder>{
        ClassInfo.routeName: (BuildContext context) => new ClassInfo(),
        SearchClasses.routeName: (BuildContext context) => new SearchClasses(title: "SearchClasses"),

      },
      home: new HomePage(),
    );
  }
}


