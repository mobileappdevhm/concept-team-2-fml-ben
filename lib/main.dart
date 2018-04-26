import 'package:flutter/material.dart';
import 'package:demo_muas_sliding/pages/homePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Courses in English',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new HomePage(),
    );
  }
}


